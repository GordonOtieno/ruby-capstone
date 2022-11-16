require_relative '../music_album/music_album'

describe MusicAlbum do
  it 'test for pulish date' do
    album = MusicAlbum.new(true, Time.now.year)
    expect(album.publish_date).to eq(Time.now.year)
  end

  it 'instance of Album class' do
    album = MusicAlbum.new(true, Time.now.year)
    expect(album).to be_an_instance_of(MusicAlbum)
  end
  it 'instance of Album sportify' do
    album = MusicAlbum.new(true, Time.now.year)
    expect(album.on_spotify).to eq(true)
  end
end
