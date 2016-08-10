require "sinatra"
require "sinatra/contrib/all"
require "pry-byebug"

require_relative "./models/artist"
require_relative "./models/album"

get '/artists/new' do
  erb(:'artists/new')
end

post '/artists' do
  @artist = Artist.new(params)
  @artist.save()
  erb(:'artists/create')
end