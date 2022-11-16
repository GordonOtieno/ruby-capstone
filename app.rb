require_relative './book/book'
require_relative './book/label'
require_relative './game/author'
require_relative './game/game'
require_relative './game/game_module'
require_relative './book/book_module'
require 'json/add/struct'
require 'json'

ItemStruct = Struct.new(:item)
GameStruct = Struct.new(:game)

class App
  def initialize
    @books = []
    @labels = []
    @authors = []
    @games = []
  end

  include GameModule
  include BookModule

  def books
    puts "
           1. List all books
           2. List all labels
           3. Add new book
           4. list all books by author
        "
    choice = gets.chomp
    case choice
    when '1'
      list_books
    when '2'
      labels_list
    when '3'
      add_book
    when '4'
      list_all_book_authors
    else
      puts 'Invalid choice'
      books
    end
  end

  def games
    puts "
            1. add_game
            2. list_games
            3. list_all_game_authors
            4. list_all_game_name
            "
    choice = gets.chomp
    case choice
    when '1'
      add_game
    when '2'
      list_all_game
    when '3'
      list_game_by_author
    when '4'
      list_all_game_name
    else
      puts 'Invalid choice'
      Game
    end
  end
end
