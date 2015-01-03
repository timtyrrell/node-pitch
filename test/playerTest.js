import {Player} from '../src/player'
var chai = require('chai')
chai.should()

describe('Player', () => {
  let player;

  before(() => {
    player = new Player('Tanis')
  });

  describe('#new', () => {
    it('has a name', () => {
      player.name.should.equal('Tanis')
    });
  });
});
