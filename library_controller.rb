require "sinatra"
require "sinatra/contrib/all"
require "pry-byebug"

require_relative "./models/artist"
require_relative "./models/album"

get '/' do
  erb(:home)
end

# artist routes

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

get '/artists/:id/edit' do
  @artist = Artist.find(params['id'])
  erb(:'artists/edit')
end

post '/artists/:id' do
  Artist.update(params)
  redirect to "/artists/#{params['id']}"
end

post '/artists/:id/delete' do
  Artist.destroy(params['id'])
  redirect to "/artists"
end

# album routes