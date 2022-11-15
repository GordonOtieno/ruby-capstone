require_relative './app'

@method = App.new

def main_menu
  # catalogs of things to do
  puts 'welcome to my App'
  puts '1. Add book'
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
    @method.add_label
  when 3
    @method.list_books
  when 4
    @method.list_labels
  when 5
    @method.list_books_by_label
  when 6
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
