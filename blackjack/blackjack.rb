# frozen_string_literal: true

CARDS_VALUES = { 'two' => 2, 'three' => 3, 'four' => 4, 'five' => 5, 'six' => 6,
                 'seven' => 7, 'eight' => 8, 'nine' => 9, 'ten' => 10, 'jack' => 10,
                 'queen' => 10, 'king' => 10, 'ace' => 11 }.freeze

# Blackjack
module Blackjack
  def self.parse_card(card)
    CARDS_VALUES[card.downcase] || 0
  end

  def self.card_range(card1, card2)
    case parse_card(card1) + parse_card(card2)
    when 4..11 then 'low'
    when 12..16 then 'mid'
    when 17..20 then 'high'
    when 21 then 'blackjack'
    end
  end

  def self.first_turn(card1, card2, dealer_card)
    hand_score = parse_card(card1) + parse_card(card2)
    dealer_score = parse_card(dealer_card)

    return 'P' if hand_score == 22
    return 'W' if hand_score == 21 && dealer_score < 10
    return 'S' if hand_score >= 17 || (hand_score >= 12 && dealer_score < 7)

    'H'
  end
end
