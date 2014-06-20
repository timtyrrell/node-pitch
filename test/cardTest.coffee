{Card} = require ('../src/card')

describe 'Card', ->
  describe '#new', ->
    before -> @card = new Card 'Heart', '2'

    it 'has a suit', ->
      @card.suit.should.equal 'Heart'
    it 'has a value', ->
      @card.value.should.equal '2'
