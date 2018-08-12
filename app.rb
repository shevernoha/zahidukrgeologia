require 'sinatra'
require "sinatra/config_file"
require "sinatra/content_for"

config_file 'config.yml'
config_file 'locales/*.yml'

get '/' do
  slim :home, layout: false, locals: { l: settings.ua }
end

get /\/(en|ua|ru|es)\/?/ do
  slim :home, layout: false, locals: { l: settings.send(params['captures'].first) }
end

get '/google843e00e5e643230e' do
  send_file 'views/google.html'
end

get '/favicon.ico' do
  send_file 'public/images/favicon-16x16.png'
end

get '/*' do
  slim :"pages/#{params[:splat].first}"
end
