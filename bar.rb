require("pry")

class Bar

    attr_accessor :tabs, :name

    def initialize(name)
    @name = name
    @tabs = Hash.new(0)
    end

end