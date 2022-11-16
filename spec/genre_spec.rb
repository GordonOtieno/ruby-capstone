require_relative '../music_album/genre'

describe Genre do
  it 'instance of Genre class' do
    genre = Genre.new('gordon')
    expect(genre).to be_an_instance_of(Genre)
  end

  it 'Name be equal ' do
    genre = Genre.new('genre')
    expect(genre.name).to eq('genre')
  end
end
