import {Team} from '../src/team'
import {Player} from '../src/player'
var chai = require('chai')
chai.should()

describe('Team', () => {
  context('when creating a team', () => {
    it('can take a name', () => {
      let team = new Team("Cool People")
      team.name.should.equal("Cool People")
    })
  })

  context('when checking validity', () => {
    it('has 2 players', () => {
      let team = new Team()
      team.addPlayer1(new Player())
      team.addPlayer2(new Player())
      team.isValid().should.be.true
    })

    it('must have 2 players', () => {
      let team = new Team()
      team.isValid().should.be.false
    })
  })

  context('when adding players', () => {
    let player1, player2, team
    before(() => {
      player1 = new Player()
      player2 = new Player()
      team = new Team()
      team.addPlayer1(player1)
      team.addPlayer2(player2)
    })

    it('has 2 players', () => {
      team.player1.should.equal(player1)
      team.player2.should.equal(player2)
    })

    it('sets the players team', () => {
      player1.team.should.equal(team)
      player2.team.should.equal(team)
    })
  })
})
