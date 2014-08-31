{Game} = require '../src/game'
{Player} = require '../src/player'
{Team} = require '../src/team'
{Round} = require '../src/round'
chai = require 'chai'
chai.should()
sinon = require 'sinon'
sinonChai = require 'sinon-chai'
chai.use(sinonChai)

describe "Game", ->
  context "when checking validitiy", ->
    it "has 2 teams", ->
      game = new Game
      game.addTeam1 new Team
      game.addTeam2 new Team
      game.isValid().should.be.true

    it "must have 2 teams", ->
      game = new Game
      game.addTeam1 new Team new Player, new Player
      game.isValid().should.equal false

  context "when starting a game", ->
    it "checks validity", ->
      game = new Game
      spy = sinon.spy(game, 'isValid')
      try
        game.start()
      catch
        spy.should.have.been.calledOnce

    it "creates a round", ->
      game = new Game
      stub = sinon.stub(game, 'isValid').returns(true)
      initial  = sinon.stub(Round::, 'initialPlayerOrder')
      game.start()
      game.rounds.should.have.length 1
      stub.restore()
      initial.restore()

    it "triggers the initial round player order", ->
      game = new Game
      stub = sinon.stub(game, 'isValid').returns(true)
      spy = sinon.stub(Round::, 'initialPlayerOrder')
      game.start()
      spy.should.have.been.calledOnce
      stub.restore()
      spy.restore()

  context "when adding teams", ->
    it "adds a new team", ->
      team1 = new Team
      team2 = new Team
      game = new Game
      game.addTeam1 team1
      game.addTeam2 team2
      game.team1.should.equal team1
      game.team2.should.equal team2

  context "when checking if the winning score is reached", ->
    beforeEach ->
      @team1 = new Team
      @team2 = new Team
      @game = new Game
      @game.addTeam1 @team1
      @game.addTeam2 @team2

    it "is reached if a team has 15 or more points", ->
      @team1.score = 15
      @game.winningScoreReached().should.be.true

    it "is not reached if no team has more than 15 points", ->
      @game.winningScoreReached().should.be.false

  context "when returning round informations", ->
    beforeEach ->
      @game = new Game
      @firstRound = new Round
      @game.rounds.push @firstRound

    it "declares the first round", ->
      @game.firstRound().should.be.true

    it "can return the current round", ->
      @game.currentRound().should.equal @firstRound

  context "when seeking the other players team", ->
    it "returns the other players team", ->
      team1 = new Team
      team2 = new Team
      game = new Game
      game.addTeam1 team1
      game.addTeam2 team2

      game.otherTeam(team1).should.equal team2
      game.otherTeam(team2).should.equal team1

  context "when seeking the clockwise seated player", ->
    it "returns the player", ->
      player1 = new Player "p1"
      player2 = new Player "p2"
      player3 = new Player "p3"
      player4 = new Player "p4"
      team1 = new Team "Team1"
      team1.addPlayer1 player1
      team1.addPlayer2 player2
      team2 = new Team "Team2"
      team2.addPlayer1 player3
      team2.addPlayer2 player4
      game = new Game
      game.addTeam1 team1
      game.addTeam2 team2

      game.clockwiseSeatedPlayerFrom(player1).should.equal player3
      game.clockwiseSeatedPlayerFrom(player2).should.equal player4
      game.clockwiseSeatedPlayerFrom(player3).should.equal player1
      game.clockwiseSeatedPlayerFrom(player4).should.equal player2

  context.only "when dealing cards", ->
    before -> @game = new Game

    it "gives 6 cards", ->
      @game.dealCards()

    it "removes 6 cards from the deck"

