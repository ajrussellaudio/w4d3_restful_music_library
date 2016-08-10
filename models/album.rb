class Album

  attr_reader :name, :artist_id, :id

  def initialize( options )
    @name      = options["name"]
    @artist_id = options["artist_id"].to_i
    @id        = options["id"].to_i
  end

end