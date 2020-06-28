require("pry")

class Bar

    attr_reader :tabs, :name, :total_cash

    def initialize(name)
    @name = name
    @tabs = []
    end

    def add_room_tab_to_bar_tabs(room)
        room_tab = room.tab
        room_name = room.name
        @tabs << {"#{room_name}": room_tab}
    end

end