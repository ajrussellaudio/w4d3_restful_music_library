class Album

  attr_reader :title, :artist_id, :id

  def self.all()
    sql = "SELECT * FROM albums;"
    albums = SqlRunner.run( sql )
    return albums.map { |album| Album.new(album) }
  end

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = #{id};"
    album = SqlRunner.run( sql ).first
    return Album.new(album)
  end

  def self.update( options )
    sql = "UPDATE albums SET 
      title     = '#{options['title']}',
      artist_id = #{options['artist_id']}
      WHERE id = #{options['id']};"
    SqlRunner.run( sql )
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

  def artist()
    sql = "SELECT * FROM artists WHERE id = #{@artist_id};"
    artist = SqlRunner.run( sql ).first
    return Artist.new(artist)
  end

end