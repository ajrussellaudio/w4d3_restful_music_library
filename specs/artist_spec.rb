require "minitest/autorun"
require "minitest/rg"

require_relative "../models/artist"

class TestArtist < MiniTest::Test

  def setup()
    @test_artist = Artist.new({
      "name" => "U2"
      })
  end

  def test_has_name
    assert_equal("U2", @test_artist.name)
  end

end