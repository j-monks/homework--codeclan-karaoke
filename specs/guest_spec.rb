require( 'minitest/autorun' )
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative( '../guest' )


class TestGuest < MiniTest::Test

    def setup()
        @guest1 = Guest.new("James", 30.00, )
    end

end