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
    end

    def test_bar_has_name()
        assert_equal("Karaoke Bar", @bar.name)
    end

    def test_bar_has_tabs
        assert_equal(0, @bar.tabs.length)
    end

end