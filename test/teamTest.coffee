{Team} = require '../src/team'
{Player} = require '../src/player'
chai = require 'chai'
chai.should()

describe "Team", ->
  context "when creating a team", ->
    it "can take a name", ->
      team = new Team "Cool People"
      team.name.should.equal "Cool People"

  context "when checking validitiy", ->
    it "has 2 players", ->
      team = new Team
      team.addPlayer1 new Player
      team.addPlayer2 new Player
      team.isValid().should.be.true

    it "must have 2 players", ->
      team = new Team
      team.addPlayer1 new Player
      team.isValid().should.be.false

  context "when adding players", ->
    before ->
      @player1 = new Player
      @player2 = new Player
      @team = new Team
      @team.addPlayer1 @player1
      @team.addPlayer2 @player2

    it "adds a new player", ->
      @team.player1.should.equal @player1
      @team.player2.should.equal @player2

    it "sets the players team", ->
      @player1.team.should.equal @team
      @player2.team.should.equal @team
