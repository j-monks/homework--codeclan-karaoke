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

        @guest1 = Guest.new("James", 30.00, @song1)
        @guest2 = Guest.new("Kayley", 25.00, @song2)


        @room1 = Room.new(12.50, 5)


        # @people = [@guest1, @guest2]
        # @playlist = [@song1, @song2]
    end

    def test_room_has_fee()
        assert_equal(12.50, @room1.fee)
    end

    def test_room_has_capacity()
        assert_equal(5, @room1.capacity)
    end
    
    def test_room_has_people()
        assert_equal(0, @room1.people.length)
    end

    def test_add_guest_to_room()
        @room1.add_guest_to_room(@guest1)
        assert_equal(1, @room1.people.length)
    end

    def test_room_can_check_guest_in
        
    end

    def test_guest_has_enough_money?()
    end

end