require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

describe Player do
  before :each do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @deck = Deck.new([@card1, @card2, @card3])
    @player = Player.new('Clarisa', @deck)
  end

  it "exists" do
    expect(@player).to be_an_instance_of(Player)
  end

  it "has readable attributes" do
    expect(@player.name).to eq('Clarisa')
    expect(@player.deck).to eq(@deck)
    expect(@player.deck.cards).to match_array([
      have_attributes(suit: :diamond, value: "Queen", rank: 12),
      have_attributes(suit: :spade, value: "3", rank: 3),
      have_attributes(suit: :heart, value: "Ace", rank: 14),
      ])
  end

  it "finds if player has lost" do
    expect(@player.has_lost?).to eq(false)

    @player.deck.remove_card
    expect(@player.has_lost?).to eq(false)

    @player.deck.remove_card
    expect(@player.has_lost?).to eq(false)

    @player.deck.remove_card
    expect(@player.has_lost?).to eq(true)
    expect(@player.deck.cards).to eq([])

  end

end
