require "sinatra"
require "sinatra/contrib/all"
require "pry-byebug"

require_relative "./models/artist"
require_relative "./models/album"

get '/artists/new' do
  erb(:'artists/new')
end
