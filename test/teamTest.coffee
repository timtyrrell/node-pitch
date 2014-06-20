{Team} = require '../src/team'
{Player} = require '../src/player'
chai = require 'chai'
chai.should()

describe "Team", ->
  context "when checking validitiy", ->
    it "has 2 players", ->
      player1 = new Player
      player2 = new Player
      team = new Team player1, player2
      team.isValid().should.equal true

    it "must have 2 players", ->
      player1 = new Player
      team = new Team player1
      team.isValid().should.equal false


