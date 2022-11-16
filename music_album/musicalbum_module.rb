module MusicAlbumModule
  def add_musicalbum
    puts 'Enter published Date'
    date_published = gets.chomp.to_s
    puts 'Please enter True or False for spotify'
    sportify = gets.chomp.to_s
    puts 'Please enter Authors First name'
    first_name = gets.chomp.to_s
    puts 'Please enter Authors Last name'
    last_name = gets.chomp.to_s
    puts 'Please Enter Album genre'
    album_name = gets.chomp.to_s
    author = Author.new(first_name, last_name)
    genre = Genre.new(album_name)
    musicalbum = MusicAlbum.new(sportify, date_published)
    puts 'Music Album added successfully'
    json = JSON.generate(AlbumStruct.new({ album_name: album_name, sportify: sportify, date_published: date_published, first_name: author.first_name, last_name: author.last_name }))
    @album << json
    File.write('./music_album/musicalbum.json', @album)
  end

  def list_genre
    genre_data = './music_album/genre.json'
    @album = JSON.parse(File.read(genre_data)) if File.exist?(genre_data) && File.read(genre_data) != ''
    if @album.length.zero?
      puts 'You don\'t have any album available'
    else
      @album.each_with_index do |s, index|
        s = JSON.parse(s, create_additions: true)
        puts "#{index + 1}. #{s.album['album_name']}"
      end
    end
  end

  def list_musicalbums
    album_data = './music_album/musicalbum.json'
    @album = JSON.parse(File.read(album_data)) if File.exist?(album_data) && File.read(album_data) != ''
    if @album.empty?
      puts "\nMusic Album list is empty"
    else

      puts "\nList of all Music Albums"
      @album.each_with_index do |album, _index|
        album = JSON.parse(album, create_additions: true)
        puts "Album Name: \"#{album.album["album_name"]}\", on_sportify: #{album.album["sportify"]}, Publish Date: #{album.album["date_published"]}, First name: #{album.album["first_name"]}, Last Name: #{album.album["last_name"]}"
      end
    end
  end
end
