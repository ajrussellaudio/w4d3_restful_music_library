require_relative "../db/sql_runner"

class Artist

  attr_reader :name, :id

  def self.all()
    sql = "SELECT * FROM artists;"
    artists = SqlRunner.run( sql )
    return artists.map { |artist| Artist.new(artist) }
  end

  def self.update(options)
    sql = "UPDATE artists SET name = '#{options['name']}' WHERE id = #{options['id']};"
    SqlRunner.run( sql )
  end

  def self.find(id)
    sql = "SELECT * FROM artists WHERE id = #{id};"
    artist = SqlRunner.run( sql ).first
    return Artist.new(artist)
  end

  def self.destroy(id)
    sql = "DELETE FROM artists WHERE id = #{id};"
    SqlRunner.run( sql )
  end

  def initialize( options )
    @name = options["name"]
    @id   = options["id"].to_i
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ('#{@name}') RETURNING * ;"
    artist = SqlRunner.run( sql ).first
    @id = artist['id'].to_i
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = #{@id}"
    albums = SqlRunner.run(sql)
    return albums.map { |album| Album.new(album) }
  end

end