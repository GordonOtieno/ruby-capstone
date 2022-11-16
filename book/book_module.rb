module BookModule
  def add_book
    puts 'Enter book publisher: '
    publisher = gets.chomp.to_s
    puts 'Enter book cover state(y: good, n: bad): '
    cover_state = cover_state_choice(gets.chomp)
    puts 'Enter book publish date: '
    publish_date = gets.chomp.to_i
    puts 'Enter label title: '
    title = gets.chomp.to_s
    puts 'Enter label color: '
    color = gets.chomp.to_s
    label = Label.new(title, color)
    book = Book.new(publisher, cover_state, publish_date)
    puts "book #{book} added"
    json = JSON.generate(ItemStruct.new({ publisher: publisher, cover_state: cover_state,
                                          publish_date: publish_date, label: label.title, color: label.color }))
    @books << json
    File.write('./book/books.json', @books)
  end

  def labels_list
    label_data = './book/labels.json'
    @books = JSON.parse(File.read(label_data)) if File.exist?(label_data) && File.read(label_data) != ''
    if @books.length.zero?
      puts 'You don\'t have any books available'
    else
      @books.each_with_index do |s, _index|
        s = JSON.parse(s, create_additions: true)
        puts "#{index + 1}. #{s.item['label']}"
      end
    end
  end

  def add_book_to_label(book, label)
    label.add_item = book
  end

  def list_books
    book_data = './book/books.json'
    @books = JSON.parse(File.read(book_data)) if File.exist?(book_data) && File.read(book_data) != ''
    if @books.empty?
      puts "\nBook list is empty"
    else
      # Read file from ./book/books.json
      puts "\nList of all Books"
      @books.each_with_index do |book, _index|
        book = JSON.parse(book, create_additions: true)
        puts "Publisher: \"#{book.item["publisher"]}\", Cover State: #{book.item["cover_state"]}, Publish Date: \"#{book.item["publish_date"]}\", Label: #{book.item["label"]}, Color: #{book.item["color"]}"
      end
    end
  end

  def cover_state_choice(state)
    case state
    when 'y'
      'good'
    when 'n'
      'bad'
    else
      puts 'Invalid choice'
      puts ''
      puts 'Cover state Good (Y) OR Bad (N):'
      state = gets.chomp
      cover_state_choice(state)
    end
  end
end
