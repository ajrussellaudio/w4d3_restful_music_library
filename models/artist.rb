class Artist

  attr_reader :name, :id

  def self.all()
  end

  def initialize( options )
    @name = options["name"]
    @id   = options["id"].to_i
  end

end