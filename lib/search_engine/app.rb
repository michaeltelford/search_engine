require 'sinatra'
require 'slim'

not_found do
  "Not found, sorry!"
end

error do
  "An error has occurred."
end

get '/' do
  redirect to('/search')
end

get '/search' do
  slim :search, layout: true
end
