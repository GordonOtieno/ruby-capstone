require_relative './app'

@method = App.new

def main_menu
  # catalogs of things to do
  puts 'welcome to my App'
  puts '1. Add book'
  puts '2. Add Game'
  puts '6. Exit'
  puts 'Choose an option: '
end

def user_choice
  gets.chomp.to_i
end

def run(choice)
  case choice
  when 1
    @method.books
  when 2
    @method.games
  when 3
    exit
  else
    puts 'Invalid option'
  end
end

def main(status)
  loop do
    break unless status

    main_menu
    choice = user_choice
    break if choice == 6

    run(choice)
  end
end

main(true)
