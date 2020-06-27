require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../guest")
require_relative("../song")


class TestGuest < MiniTest::Test

    def setup()
        @song1 = Song.new("Come On Eileen", "Dexys Midnight Runners", "Alternative/Indie")
        @guest1 = Guest.new("James", 30.00, @song1)
    end

    def test_guest_has_name()
        assert_equal("James", @guest1.name)
    end

    def test_guest_has_wallet()
        assert_equal(30.00, @guest1.wallet)
    end

    def test_guest_has_favourite_song()
        assert_equal(@song1, @guest1.favourite_song)
    end
    
end