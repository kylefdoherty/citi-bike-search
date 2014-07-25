ENV['SINATRA_ENV'] ||= "production"

require 'bundler/setup'

Bundler.require(:default, ENV['SINATRA_ENV'])

# ActiveRecord::Base.establish_connection(
#   :adapter => "postgresql",
#   :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
# )

configure :production do
  db = URI.parse(ENV['HEROKU_POSTGRESQL_GOLD_URL'] || 'postgres://localhost/mydb')

  ActiveRecord::Base.establish_connection(
    :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
  )
end

require_all 'app'
