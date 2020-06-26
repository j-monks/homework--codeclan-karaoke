require("pry")

class Room

    def initialize(fee, capacity)
        @fee = fee
        @capacity = capacity
        @people = []
        @songs = []
    end

end