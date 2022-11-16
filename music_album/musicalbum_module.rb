module MusicAlbumModule
  def add_musicalbum
    puts 'Enter published Date'
    date_published = gets.chomp.to_s
    puts 'Please enter True or False for spotify'
    sportify = gets.chomp.to_s
    puts 'Please Enter Music Album Name'
    album_name = gets.chomp.to_s
    genre = new Genre(album_name)
    musicalbum = MusicAlbum.new(sportify, date_published)
    puts "Music Album #{musicalbum} added successfully"
    json = JSON.generate(ItemStruct.new({ album_name: album_name, sportify: sportify, date_published: date_published }))
    @album << json
    File.write('./music_album/musicalbum.json', @album)
  end

  def list_genre
    genre_data = './music_album/genre.json'
    @album = JSON.parse(File.read(genre_data)) if File.exist?(genre_data) && File.read(genre_data) != ''
    if @album.length.zero?
      puts 'You don\'t have any album available'
    else
      @album.each_with_index do |s, _index|
        s = JSON.parse(s, create_additions: true)
        puts "#{index + 1}. #{s.item['genre']}"
      end
    end
  end

  def add_musicalbum_to_genre(album, genre)
    genre.add_item = album
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
        puts "Album Name: \"#{album.item["album_name"]}\", on_sportify: #{album.item["sportify"]}, Publish Date: #{album.item["date_published"]}"
      end
    end
  end
end

