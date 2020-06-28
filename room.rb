require("pry")

class Room

    attr_reader :name, :fee, :capacity, :people, :playlist, :tab

    def initialize(name, fee, capacity)
        @name = name
        @fee = fee
        @capacity = capacity
        @people = []
        @playlist = []
        @tab = []
    end

    def add_guest_to_room(guest)
        return if @people.length >= @capacity
        @people.push(guest) 
    end

    def remove_guest_from_room(guest)
        @people.delete(guest)
    end

    def add_song_to_room(song)
        @playlist << song
    end

    def update_guest_tab(guest)
        guest_tab_hash = {}
        guest_name = guest.name
        guest_tab_hash[guest_name.to_sym] = @fee
        @tab << guest_tab_hash
    end

    def guest_tab(guest)
        guest_name = guest.name
        result = @tab.find { |guest| guest[guest_name.to_sym] }
        return result
    end
 
    def check_in_guest(guest)
        add_guest_to_room(guest) && guest.pay_room_fee(@fee) && update_guest_tab(guest) if guest.sufficient_funds?(@fee)
        return guest.cheer if @playlist.find { |song| song == guest.favourite_song }
    end

    def check_out_guest(guest)
        remove_guest_from_room(guest)
    end

end

