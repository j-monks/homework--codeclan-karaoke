require("pry")

class Room

    attr_reader :fee, :capacity, :people, :songs

    def initialize(fee, capacity)
        @fee = fee
        @capacity = capacity
        @people = []
        @playlist = []
    end

end