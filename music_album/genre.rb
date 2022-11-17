require_relative './music_album'

class Genre
  attr_accessor :name, :items, :genre

  def initialize(name)
    @id = Random.rand(1..500)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item unless @item.include?(item)
    @items.add_genre = self
  end
end
