require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../guest")
require_relative("../song")
require_relative("../room")


class TestGuest < MiniTest::Test

    def setup()
        @song1 = Song.new("Come On Eileen", "Dexys Midnight Runners", "Alternative/Indie")
        
        @guest1 = Guest.new("James", 30.00, @song1)

        @room1 = Room.new(12.50, 5)
    end

    def test_has_name
        assert_equal("James", @guest1.name)
    end

    def test_has_wallet
        assert_equal(30.00, @guest1.wallet)
    end

    def test_has_favourite_song
        assert_equal(@song1, @guest1.favourite_song)
    end

    def test_sufficient_funds__true_if_enough
        assert_equal(true, @guest1.sufficient_funds?(12.50))
    end

    def test_sufficient_funds__false_if_not_enough
        poor_guest = Guest.new("Kayley", 10, @song1)
        assert_equal(false, poor_guest.sufficient_funds?(12.50))
    end

    def test_guest_can_pay_room_fee__decreases_money
        @guest1.pay_room_fee(12.50)
        assert_equal(17.50, @guest1.wallet)
    end

    def test_guest_cannot_pay_room_fee_if_insufficient_funds
        poor_guest = Guest.new("Kayley", 10, @song1)
        poor_guest.pay_room_fee(12.50)
        assert_equal(10, poor_guest.wallet)
    end

end