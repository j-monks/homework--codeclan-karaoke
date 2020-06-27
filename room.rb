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
        @people.push(guest) if guest.sufficient_funds?(@fee)
    end
end