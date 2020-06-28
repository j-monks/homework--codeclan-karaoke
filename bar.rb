require("pry")

class Bar

    attr_accessor :tabs, :name, :total_cash

    def initialize(name)
    @name = name
    @tabs = Hash.new(0)
    @total_cash = 0
    end

    def add_room_tab_to_bar_tabs(room)
        room.tab
    binding.pry
    end

end