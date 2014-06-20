{Deck} = require '../src/deck'
_ = require 'underscore'
chai = require 'chai'
chai.should()
sinon = require 'sinon'
sinonChai = require 'sinon-chai'
chai.use(sinonChai)

describe 'Deck', ->
  describe '#cards()', ->
    it 'has 52 cards', ->
      @deck = new Deck
      @deck.cards.length.should.equal 52

    it 'has 13 cards of each suit', ->
      @deck = new Deck
      _.each ['Hearts', 'Diamonds', 'Clubs', 'Spades'], (suit) =>
        (_.filter @deck.cards, (card) -> card.suit == suit).length.should.equal 13

    it 'has 13 different values for each suit', ->
      @deck = new Deck
      _.each ['Hearts', 'Diamonds', 'Clubs', 'Spades'], (suit) =>
        _.each ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'], (value) =>
          (_.find @deck.cards, (card) -> card.value == value && card.suit == suit).should.exist

    context "when building the cards", ->
      before -> @spy = sinon.spy(_, 'shuffle')

      it 'returns in random order', ->
        @deck = new Deck
        @spy.should.have.been.calledOnce

      after -> _.shuffle.restore()

