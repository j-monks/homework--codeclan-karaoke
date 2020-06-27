require("pry")

class Guest
    
    attr_accessor :name, :wallet, :favourite_song

    def initialize(name, wallet, favourite_song)
        @name = name
        @wallet = wallet
        @favourite_song = favourite_song    
    end

    def sufficient_funds?(room)
        if @wallet > room.fee
            return true
        else
            return false
        end
    end

    def pay_room_fee(room)
        @wallet -= room.fee
    end

end