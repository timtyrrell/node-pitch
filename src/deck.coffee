{Card} = require './card'
_ = require 'underscore'

class Deck
  constructor: ->
    @cards = @buildDeck()

  buildDeck: ->
    cards = []
    suits = ['Hearts', 'Diamonds', 'Clubs', 'Spades']
    values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
    _.each suits, (suit) ->
      _.each values, (value) ->
        cards.push new Card suit, value
    _.shuffle cards

module.exports.Deck = Deck
