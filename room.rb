require("pry")

class Room

    attr_reader :fee, :capacity, :people, :playlist
    attr_accessor :tab

    def initialize(fee, capacity)
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
 
    def check_in_guest(guest)
        add_guest_to_room(guest) && guest.pay_room_fee(@fee) if guest.sufficient_funds?(@fee)
        return guest.cheer if @playlist.find { |song| song == guest.favourite_song }
    end

    def check_out_guest(guest)
        remove_guest_from_room(guest)
    end

end