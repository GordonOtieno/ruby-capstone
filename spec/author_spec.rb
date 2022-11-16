require_relative '../game/author'

describe Author do
  it 'instance of Author class' do
    author = Author.new('john', 'doe')
    expect(author).to be_an_instance_of(Author)
  end

  it 'first_name be equal ' do
    author = Author.new('john', 'doe')
    expect(author.first_name).to eq('john')
  end

  it 'last_name be equal ' do
    author = Author.new('john', 'doe')
    expect(author.last_name).to eq('doe')
  end
end
