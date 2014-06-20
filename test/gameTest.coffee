{Game} = require '../src/game'
{Player} = require '../src/player'
{Team} = require '../src/team'
chai = require 'chai'
chai.should()
sinon = require 'sinon'
sinonChai = require 'sinon-chai'
chai.use(sinonChai)

describe "Game", ->
  context "when checking validitiy", ->
    it "has 2 teams", ->
      team1 = new Team new Player, new Player
      team2 = new Team new Player, new Player
      game = new Game team1, team2
      game.isValid().should.equal true

    it "must have 2 teams", ->
      team1 = new Team new Player, new Player
      game = new Game team1
      game.isValid().should.equal false

  context "when starting a game", ->
    describe "checks validity", ->
      before ->
        @game = new Game
        @spy = sinon.spy(@game, 'isValid')

      it "checks once", ->
        @game.start()
        @spy.should.have.been.calledOnce

      after -> @game.isValid.restore()
