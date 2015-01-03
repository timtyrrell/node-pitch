import {Card} from '../src/card'
var chai = require('chai')
chai.should()

describe('Card', () => {
  let card;

  before(() => {
    card = new Card('Heart', 2)
  });

  describe('#new', () => {
    it('has a suit', () => {
      card.suit.should.equal('Heart')
    });
    it('has a value', () => {
      card.value.should.equal(2)
    });
  });
});
