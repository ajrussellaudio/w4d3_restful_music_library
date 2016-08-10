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

get '/artists' do
  @artists = Artist.all()
  erb(:'artists/index')
end

get '/artists/:id' do
  @artist = Artist.find(params['id'])
  erb(:'artists/show')
end