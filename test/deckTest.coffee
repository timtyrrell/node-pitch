{Deck} = require '../src/deck'
_ = require 'underscore'
chai = require 'chai'
chai.should()
sinon = require 'sinon'
sinonChai = require 'sinon-chai'
chai.use(sinonChai)

describe 'Deck', ->
  describe '#cards()', ->
    before -> @deck = new Deck
    it 'has 52 cards', ->
      @deck.cards.length.should.equal 52

    it 'has 13 cards of each suit', ->
      _.each ['Hearts', 'Diamonds', 'Clubs', 'Spades'], (suit) =>
        (_.filter @deck.cards, (card) -> card.suit == suit).length.should.equal 13

    it 'has 13 different values for each suit', ->
      _.each ['Hearts', 'Diamonds', 'Clubs', 'Spades'], (suit) =>
        _.each ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'], (value) =>
          (_.find @deck.cards, (card) -> card.value == value && card.suit == suit).should.exist

  describe '#shuffle', ->
    before -> @spy = sinon.spy(_, 'shuffle')

    it 'returns the cards random order', ->
      @deck = new Deck
      @deck.shuffle()
      @spy.should.have.been.calledOnce

    after -> _.shuffle.restore()
