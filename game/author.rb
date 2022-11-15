require 'securerandom'
require_relative 'game'

class Author
  def initialize(first_name, last_name)
    @id = SecureRandom.uuid
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(game)
    @items << game.add_author(self)
  end
end
