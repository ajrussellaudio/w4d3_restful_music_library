class Album

  attr_reader :title, :artist_id, :id

  def self.all()
    sql = "SELECT * FROM albums;"
    albums = SqlRunner.run( sql )
    return albums.map { |album| Album.new(album) }
  end

  def initialize( options )
    @title     = options["title"]
    @artist_id = options["artist_id"].to_i
    @id        = options["id"].to_i
  end

  def save()
    sql = "INSERT INTO albums (title, artist_id) VALUES ('#{@title}', #{artist_id}) RETURNING * ;"
    album = SqlRunner.run( sql ).first
    @id = album['id'].to_i
  end

end