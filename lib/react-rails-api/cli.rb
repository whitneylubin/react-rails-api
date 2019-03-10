require 'thor'
require_relative 'version'

class ReactRailsAPI::CLI < Thor
  TEMPLATE = File.join __dir__, 'template.rb'

  method_option :database, type: :boolean, desc: 'Integrate ActiveRecord (and Postgres).', default: true
  desc "new [\e[1mPATH\e[0m]", "\e[90mInitialise a React/Rails API application.\e[0m"
  def new(path)
    opts = default_options
    opts << '--database=postgresql' if options[:database]
    opts << '--skip-active-record' if !options[:database]
    opts << "--template=#{TEMPLATE}"
    exec "rails new #{path} #{opts.join ' '}"
  end

  map %w[--version -v] => :version
  desc '-v', "\e[90mDisplay installed React/Rails API gem version.\e[0m"
  def version
    puts ReactRailsAPI::VERSION
  end

  no_tasks do
    def default_options
      %w[
        --webpack=react
        --api
        --skip-coffee
        --skip-action-cable
        --skip-action-mailer
        --skip-turbolinks
        --skip-test
        --skip-bootsnap
        --no-bundle
      ]
    end
  end
end