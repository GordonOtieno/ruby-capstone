require_relative './game'
require_relative './author'
module GameModule
  def add_game
    puts 'Enter game name: '
    multiplayer = gets.chomp.to_s
    puts "Enter the author's first_name: "
    first_name = gets.chomp.capitalize
    puts "Enter the author's last_name: "
    last_name = gets.chomp.capitalize
    puts 'Enter last played year(YYYY): '
    last_played_at = gets.chomp.to_i
    puts 'Enter game publish year(YYYY): '
    publish_date = gets.chomp.to_i
    game = Game.new(multiplayer, last_played_at, publish_date)
    author = Author.new(first_name, last_name)
    puts "game #{game.multiplayer} added"
    json = JSON.generate(GameStruct.new({ author: author.first_name, author: author.last_name, name: multiplayer, last_played: last_played_at, published: publish_date }))
    @games << json
    File.write('./game/games.json', @games)
  end

  def list_all_game
    @games = JSON.parse(File.read('./game/games.json')) if File.exist?('./game/games.json') && File.read('./game/games.json') != ''
    if @games.empty?
      puts ''
    else
      puts "Total games:#{@games.count}"
      @games.each_with_index do |game, index|
        game = JSON.parse(game, create_additions: true)
        puts " #{index + 1}). The Game:#{game.game['name']}, is written by: #{game.game['author']}, last played at: #{game.game['last_played']}, and was published in: #{game.game['published']}"
      end
    end
  end

  def list_game_by_author
    @games = JSON.parse(File.read('./game/games.json')) if File.exist?('./game/games.json') && File.read('./game/games.json') != ''
    if @games.empty?
      puts ''
    else
      puts "Total games:#{@games.count}"
      @games.each_with_index do |game, index|
        game = JSON.parse(game, create_additions: true)
        puts " #{index + 1}). The Game:  #{game.game['name']}, is written by: #{game.game['author']}"
      end
    end
  end

  def list_all_game_name
    @games = JSON.parse(File.read('./game/games.json')) if File.exist?('./game/games.json') && File.read('./game/games.json') != ''
    if @games.empty?
      puts ''
    else
      puts "Total games:#{@games.count}"
      @games.each_with_index do |game, index|
        game = JSON.parse(game, create_additions: true)
        puts " #{index + 1}). The Game:  #{game.game['name']}"
      end
    end
  end
end
