require_relative '../game/game'

describe Game do
  it 'can be archived' do
    game = Game.new('john', Time.now.year, Time.now.year)
    expect(game.can_be_archived?).to eq(false)
  end

  it 'instance of Game class' do
    game = Game.new(true, Time.now.year, Time.now.year)
    expect(game).to be_an_instance_of(Game)
  end

  it 'multiplayer be equal ' do
    game = Game.new('john', Time.now.year, Time.now.year)
    expect(game.multiplayer).to eq('john')
  end

  it 'last_played_at be equal ' do
    game = Game.new(true, Time.now.year, Time.now.year)
    expect(game.last_played_at).to eq(Time.now.year)
  end
end
