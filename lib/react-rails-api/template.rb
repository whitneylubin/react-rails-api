require_relative 'helpers'

database = !ARGV.include?('--skip-active-record')
active_admin = database ? yes?("\nUse ActiveAdmin? (Y/n):") : false
puts if database

gem_group :development, :test do
  gem 'rspec-rails'
  gem 'sqlite3', '~> 1.3.6'
  gem 'foreman', '~> 0.85.0'
end

gem_group :production do
  gem 'pg', '>= 0.18', '< 2.0'
  gsub_file 'Gemfile', "# Use postgresql as the database for Active Record\ngem 'pg', '>= 0.18', '< 2.0'\n", ''
end

if active_admin
  # Add Devise and ActiveAdmin gems to Gemfile
  gem 'devise'
  gem 'activeadmin'
  inject_into_file 'Gemfile', "# ActiveAdmin\n", before: "gem 'devise'"
end

after_bundle do
  # Stop spring from running
  run 'spring stop'

  # Integrate RSpec into the application
  generate 'rspec:install'

  # Add db/*.sqlite and db/*.sqlite-journal files to .gitignore
  append_to_file '.gitignore', "\n# Ignore the default SQLite database.\n/db/*.sqlite\n/db/*.sqlite-journal\n"

  inside File.join('app', 'controllers') do
    # Make ApplicationController inherit from ActionController::Base
    gsub_file 'application_controller.rb', 'ActionController::API', 'ActionController::Base'

    # Add protect_from_forgery and inheritance comment
    inject_into_file 'application_controller.rb', template('application_controller.rb.tt'), before: /^end/

    # Generate the API base controller (ApiController)
    generate :controller, 'API', *%w[
      --skip-routes
      --no-helper
      --no-assets
      --no-controller-specs
      --no-view-specs
      --no-helper-specs
      --no-javascripts
      --no-stylesheets
    ]

    # Make ApiController inherit from ActionController::API
    gsub_file 'api_controller.rb', 'ApplicationController', 'ActionController::API'
    inject_into_file 'api_controller.rb', "  # New controllers should inherit from this controller, not ApplicationController.\n", before: /^end/
  end

  inside 'config' do
    # Include the railtie for sprockets
    uncomment_lines 'application.rb', "require \"sprockets/railtie\""

    # Add ActiveAdmin configuration on config/application.rb
    inject_into_file 'application.rb', template('application.rb.tt'), before: /^  end/ if active_admin

    # Write config/database.yml template
    file 'database.yml', template('database.yml.tt'), force: true if database

    # Add /api scope in config/routes.rb
    inject_into_file 'routes.rb', template('routes.rb.tt'), before: /^end/
  end

  if database
    rails_command 'db:create'

    if active_admin
      # Integrate ActiveAdmin and Devise CMS into the application
      run 'spring stop'
      generate 'active_admin:install'
    end

    # Run a database migration and seed the database
    rails_command 'db:migrate'
    rails_command 'db:seed'
  end

  # Create a development Procfile for running both processes
  file 'Procfile.dev', template('Procfile.dev.tt')

  # Create a production Procfile for running the application
  file 'Procfile', template('Procfile.tt')
  inject_into_file 'Procfile', 'release: bundle exec rake db:migrate', after: "\n" if database

  # Create a rake task for starting the application in the development environment
  inside File.join('lib', 'tasks') do
    file 'start.rake', template('start.rake.tt')
  end

  # Create a top-level package.json that tells Heroku how to compile the Create React App
  modify_json 'package.json' do |json|
    json[:name] = 'api'
    json[:license] = 'MIT'
    json[:engines] = {
      node: '11.11.0',
      yarn: '1.13.0'
    }
    json[:scripts] = {
      build: "yarn --cwd client install && yarn --cwd client build",
      deploy: "cp -a client/build/. public/",
      postinstall: "yarn build && yarn deploy"
    }
  end

  # Create the React application (client)
  run 'yarn create react-app client'

  inside 'client' do
    # Add a proxy for the Rails API server (on the client)
    modify_json 'package.json' {|json| json[:proxy] = 'http://localhost:3001'}
    # Add environment variable for skipping preflight checks (client-level)
    file '.env', template('.env.tt')
  end

  # Add environment variable for skipping preflight checks (top-level)
  file '.env', template('.env.tt')

  # Prevent out-of-date yarn package errors
  run 'yarn install --check-files'
end