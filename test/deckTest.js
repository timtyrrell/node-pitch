import {Deck} from '../src/deck'
var _ = require('underscore')
var chai = require('chai')
chai.should()
var sinon = require('sinon')
var sinonChai = require('sinon-chai')
chai.use(sinonChai)

describe('Deck', () => {
  let deck

  before(() => { deck = new Deck() })

  describe('#new', () => {
    it('has 52 cards', () => {
      deck.cards.should.have.length(52)
    })

    it('has 13 cards of each suit', () => {
      _.each(['hearts', 'diamonds', 'clubs', 'spades'], (suit) => {
        (_.filter(deck.cards, (card) => card.suit == suit)).should.have.length(13)
      })
    })

    it('has 13 different values for each suit', () => {
      _.each(['hearts', 'diamonds', 'clubs', 'spades'], (suit) => {
        _.each(['2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'queen', 'king', 'ace'], (value) => {
          (_.find(deck.cards, (card) => {
            return ((card.value == value) && (card.suit == suit))
          })).should.exist
        })
      })
    })
  })

  describe('#shuffle', () => {
    let spy, deck

    before(() => { spy = sinon.spy(_, 'shuffle') })

    it('returns the cards random order', () => {
      deck = new Deck()
      deck.shuffle()
      spy.should.have.been.calledOnce
    })

    after(() => { _.shuffle.restore() })
  })
})
