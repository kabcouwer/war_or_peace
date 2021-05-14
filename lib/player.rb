class Player
  attr_reader :name,
              :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    unless @deck.cards.empty?
      true
    end
    false
  end

end
