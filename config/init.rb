# Go to http://wiki.merbivore.com/pages/init-rb
 
require "#{Merb.root}/vendor/gems/environment.rb"
#require 'config/dependencies.rb'
Bundler.require_env
 
use_orm :datamapper
use_test :rspec
use_template_engine :erb
 
Merb::Config.use do |c|
  c[:use_mutex] = false
  c[:session_store] = 'cookie'  # can also be 'memory', 'memcache', 'container', 'datamapper
  
  # cookie session store configuration
  c[:session_secret_key]  = '99573fac28233f712b03e71928349932e5e164cb'  # required for cookie session store
  c[:session_id_key] = '_bundler_project_session_id' # cookie session id key, defaults to "_session_id"
end
 
Merb::BootLoader.before_app_loads do
  # This will get executed after dependencies have been loaded but before your app's classes have loaded.
end
 
Merb::BootLoader.after_app_loads do
  # This will get executed after your app's classes have been loaded.
end
