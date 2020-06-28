require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../guest")
require_relative("../song")
require_relative("../room")
require_relative("../bar")


class TestBar < MiniTest::Test

    def setup()
    @bar = Bar.new("Karaoke Bar")

    @song1 = Song.new("Come On Eileen", "Dexys Midnight Runners", "Alternative/Indie")
    @song2 = Song.new("Tainted Love", "Soft Cell", "Pop")
    @song3 = Song.new("Adeline", "alt-J", "Alternative/Indie")

    @guest1 = Guest.new("Lars", 30.00, @song1)
    @guest2 = Guest.new("Kelly", 17.00, @song2)
    @guest3 = Guest.new("Fred", 15.00, @song3)
    @guest4 = Guest.new("Kim", 18.00, @song1)


    @room1 = Room.new("Room 1", 12.50, 3)
    @room2 = Room.new("Room 2", 5.50, 3)
    end

    def test_bar_has_name()
        assert_equal("Karaoke Bar", @bar.name)
    end

    def test_bar_has_tabs
        assert_equal(0, @bar.tabs.length)
    end

    def test_add_room_tab_to_bar_tabs()
        @room1.check_in_guest(@guest1)
        @room1.check_in_guest(@guest2)
        @room2.check_in_guest(@guest3)
        @room2.check_in_guest(@guest4)
        @bar.add_room_tab_to_bar_tabs(@room2)
        @bar.add_room_tab_to_bar_tabs(@room1)
        assert_equal(2, @bar.tabs.length)
    end
end