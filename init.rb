require 'redmine'

RAILS_DEFAULT_LOGGER.info 'Starting mcollective plugin for Initr'

Initr::Plugin.register :mcollective do
  redmine do
    name 'mcollective'
    author 'Ingent'
    description 'Mcollective plugin for initr'
    version '0.0.1'
    project_module :initr do
      permission :configure_mcollective,
        { :mcollective => [:configure] },
        :require => :member
    end
  end
  klasses 'mcollective' => 'Marionette Collective Node'
end

::I18n.load_path += Dir.glob(File.join("#{File.dirname(__FILE__)}", 'config', 'locales', '*.yml'))
