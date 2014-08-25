class Card
  attr_accessor :face, :suit

  def initialize face, suit
    @face, @suit = face, suit
  end

  def card
    "#{@face} of #{suit}s"
  end

end

class Hand
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def recieve_card card
    @cards << card
  end

  def cards
    @cards.each{ |card| puts card.card}
  end
  def suits
    @cards.each{ |card| card.suit }.uniq
  end
end

hand = Hand.new
hand.recieve_card Card.new('Jack', 'Heart')
hand.recieve_card Card.new('Jack', 'Spade')
hand.recieve_card Card.new('Jack', 'Club')
hand.recieve_card Card.new('Jack', 'Diamond')
hand.recieve_card Card.new('Ace', 'Heart')

hand.cards
