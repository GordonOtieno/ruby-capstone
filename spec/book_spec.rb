require_relative '../book/book'

describe Book do
  it 'can be archived' do
    book = Book.new('publisher', 'bad', Time.now.year)
    expect(book.can_be_archived?).to eq(true)
  end

  it 'instance of Book class' do
    book = Book.new('publisher', 'bad', Time.now.year)
    expect(book).to be_an_instance_of(Book)
  end

  it 'cover_state be equal ' do
    book = Book.new('publisher', 'bad', Time.now.year)
    expect(book.cover_state).to eq('bad')
  end
end
