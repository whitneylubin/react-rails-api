require 'thor'
require_relative 'version'

class ReactRailsAPI::CLI < Thor
  TEMPLATE = File.join __dir__, 'template.rb'

  class_option :database, type: :boolean, :desc => "Integrate ActiveRecord (and Postgres).", default: true

  desc 'new [PATH]', "\e[90mInitialise a React/Rails API application.\e[0m"
  def new(path)
    opts = default_options
    opts << '--database=postgresql' if options[:database]
    opts << '--skip-active-record' if !options[:database]
    opts << "--template=#{TEMPLATE}"
    exec "rails new #{path} #{opts.join ' '}"
  end

  map %w[--version -v] => :version
  desc 'version, -v', "\e[90mDisplay installed react-rails version.\e[0m"
  def version
    puts ReactRailsAPI::VERSION
  end

  def self.help(shell, subcommand = false)
    list = printable_commands(true, subcommand)
    Thor::Util.thor_classes_in(self).each do |klass|
      list += klass.printable_commands(false)
    end
    list.sort! { |a, b| a[0] <=> b[0] }
    list.reject! { |e| /.*help.*/.match? e.first }
    list.map! {|c| c.map {|s| s.gsub('decrypt', ?d).gsub('encrypt', ?e)} }

    if defined?(@package_name) && @package_name
      shell.say "#{@package_name} commands:"
    else
      shell.say "Commands:"
    end

    shell.print_table(list, :indent => 2, :truncate => true)
    shell.say
    class_options_help(shell)
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