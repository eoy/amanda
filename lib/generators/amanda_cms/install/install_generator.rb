require 'rails/generators/active_record'

module AmandaCms
  module Generators
    class InstallGenerator < ActiveRecord::Generators::Base
      desc "Installs Active Admin and generates the necessary migrations"
      argument :name, type: :string, default: "User"

      source_root File.expand_path("../templates", __FILE__)

      def copy_initializer
        @underscored_user_name = name.underscore
        @use_authentication_method = options[:users].present?
        template 'amanda_cms.rb.erb', 'config/initializers/amanda_cms.rb'
      end

      def setup_directory
        empty_directory "app/admin"
        #template 'dashboard.rb', 'app/admin/dashboard.rb'
      end

      def setup_routes
        if options[:users] # Ensure Active Admin routes occur after Devise routes so that Devise has higher priority
          inject_into_file "config/routes.rb", "\n  AmandaCms.routes(self)", after: /devise_for .*, AmandaCms::Devise\.config/
        else
          route "mount AmandaCms::Engine, at: '/admin'"
        end
      end

      def create_assets
        #generate "amanda_cms:assets"
      end

      def create_migrations
        #migration_template 'migrations/create_amanda_cms_comments.rb', 'db/migrate/create_amanda_cms_comments.rb'
      end
    end
  end
end