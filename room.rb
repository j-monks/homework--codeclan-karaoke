require("pry")

class Room

    attr_reader :fee, :capacity, :people, :songs

    def initialize(fee, capacity)
        @fee = fee
        @capacity = capacity
        @people = []
        @playlist = []
    end

    def add_guest_to_room(guest)
        return if @people.length >= @capacity
        @people.push(guest) 
    end

    def remove_guest_from_room(guest)
        @people.delete(guest)
    end

    def check_in_guest(guest)
        add_guest_to_room(guest) && guest.pay_room_fee(@fee) if guest.sufficient_funds?(@fee)
    end

end