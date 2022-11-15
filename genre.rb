class Genre
    def initialize(name)
        @id = Random.rand(1..500)
        @name = name
        @items = []
    end

    def add_item(item)
        @items << item
        puts @items
    end

end
