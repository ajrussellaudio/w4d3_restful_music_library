require_relative "../db/sql_runner"

class Artist

  attr_reader :name, :id

  def self.all()
    sql = "SELECT * FROM artists;"
    artists = SqlRunner.run( sql )
    return artists.map { |artist| Artist.new(artist) }
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

end