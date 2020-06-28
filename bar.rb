require("pry")

class Bar

    attr_accessor :tabs, :name, :total_cash

    def initialize(name)
    @name = name
    @tabs = Hash.new(0)
    @total_cash = 0
    end

    binding.pry

end