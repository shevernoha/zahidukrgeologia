require 'sinatra'
require "sinatra/config_file"
require "sinatra/content_for"
require 'pry'

config_file 'config.yml'
config_file 'locales/*.yml'

get '/' do
  slim :home, layout: false, locals: { l: settings.ua }
end

get /\/(en|ua|ru|es)\/?/ do
  slim :home, layout: false, locals: { l: settings.send(params['captures'].first) }
end

get '/*' do
  slim :"pages/#{params[:splat].first}"
end
