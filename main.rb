require_relative './app'

@method = App.new

def main_menu
  # catalogs of things to do
  puts 'welcome to my App'
  puts '1. book'
  puts '2. Game'
  puts '3. Exit'
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
    puts 'Thank you for using my App'
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
