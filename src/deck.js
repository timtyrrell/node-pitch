import {Card} from '../src/card'
var _ = require('underscore')

export class Deck {
  constructor() {
    this.cards = this.buildDeck()
  }

  buildDeck() {
    let cards = []
    let suits = ['hearts', 'diamonds', 'clubs', 'spades']
    let values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'queen', 'king', 'ace']
    _.each(suits, function(suit) {
      return _.each(values, function(value) {
        return cards.push(new Card(suit, value))
      })
    })
    return cards
  }

  shuffle() {
    return _.shuffle(this.cards)
  }
}
