require( 'minitest/autorun' )
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative( '../song' )


class TestSong < MiniTest::Test

    def setup()
        @song = Song.new("Tainted Love", "Soft Cell", "Pop")
    end

    def test_has_title()
        assert_equal("Tainted Love", @song.title)
    end

    def test_has_artist()
        assert_equal("Soft Cell", @song.artist)
    end

    def test_has_genre()
        assert_equal("Pop", @song.genre)
    end
    
end