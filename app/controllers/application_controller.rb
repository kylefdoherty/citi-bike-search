class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  configure :development do

    DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")

    end

    configure :production do

        DataMapper.setup(:default, ENV['HEROKU_POSTGRESQL_RED_URL'])

    end
end