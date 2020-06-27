require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../room")
require_relative("../song")
require_relative("../guest")

class TestRoom < MiniTest::Test

    def setup()
        @song1 = Song.new("Come On Eileen", "Dexys Midnight Runners", "Alternative/Indie")
        @song2 = Song.new("Tainted Love", "Soft Cell", "Pop")
        @song3 = Song.new("Adeline", "alt-J", "Alternative/Indie")

        @guest1 = Guest.new("James", 30.00, @song1)
        @guest2 = Guest.new("Kayley", 17.00, @song2)
        @guest3 = Guest.new("Fred", 15.00, @song3)
        @guest4 = Guest.new("Kim", 18.00, @song1)
    

        @room1 = Room.new(12.50, 3)


        # @people = [@guest1, @guest2]
        # @playlist = [@song1, @song2]
    end

    def test_room_has_fee()
        assert_equal(12.50, @room1.fee)
    end

    def test_room_has_capacity()
        assert_equal(3, @room1.capacity)
    end
    
    def test_room_has_people()
        assert_equal(0, @room1.people.length)
    end

    def test_room_has_playlist()
        assert_equal(0, @room1.playlist.length)
    end

    def test_add_song_to_room()
        @room1.add_song_to_room(@song1)
        assert_equal(1, @room1.playlist.length)
    end

    def test_remove_guest_from_room()
        @room1.add_guest_to_room(@guest1)
        @room1.remove_guest_from_room(@guest1)
        assert_equal(0, @room1.people.length)
    end

    def test_add_guest_to_room_if_room_is_not_full
        @room1.add_guest_to_room(@guest1)
        @room1.add_guest_to_room(@guest2)
        @room1.add_guest_to_room(@guest3)
        assert_equal(3, @room1.people.length)
    end

    def test_does_not_add_guest_to_room_if_room_is_full
        @room1.add_guest_to_room(@guest1)
        @room1.add_guest_to_room(@guest2)
        @room1.add_guest_to_room(@guest3)
        @room1.add_guest_to_room(@guest4)
        assert_equal(3, @room1.people.length)
    end

    def test_room_can_check_guest_in
        @room1.check_in_guest(@guest1)
        assert_equal(17.50, @guest1.wallet)
        assert_equal(1, @room1.people.length)
    end

    def test_room_can_check_guest_out
        @room1.check_in_guest(@guest1)
        @room1.check_out_guest(@guest1)
        assert_equal(0, @room1.people.length)
    end

end