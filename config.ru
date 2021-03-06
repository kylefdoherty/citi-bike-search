require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::Static, :urls => ['/stylesheets','/javascripts','/images'], :root => 'public'
use Rack::MethodOverride
use StationsController
run ApplicationController