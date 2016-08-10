require "minitest/autorun"
require "minitest/rg"

require_relative "../models/album"

class TestAlbum < MiniTest::Test

  def setup()
    @test_album = Album.new({
      "name" => "War"
      })
  end

  def test_has_name
    assert_equal("War", @test_album.name)
  end

end