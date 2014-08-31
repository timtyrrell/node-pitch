_ = require 'underscore'
{Game} = require '../src/game'
{Player} = require '../src/player'
{Team} = require '../src/team'
{Round} = require '../src/round'
chai = require 'chai'
chai.should()
sinon = require 'sinon'
sinonChai = require 'sinon-chai'
chai.use(sinonChai)

describe "Round", ->
  before -> @spy = sinon.spy(_, 'shuffle')
  after -> _.shuffle.restore()

  it "selects the initial player order randomly", ->
    p1 = new Player "p1"
    p2 = new Player "p2"
    p3 = new Player "p3"
    p4 = new Player "p4"
    team1 = new Team
    team1.addPlayer1 p1
    team1.addPlayer2 p2
    team2 = new Team
    team2.addPlayer1 p3
    team2.addPlayer2 p4
    game = new Game
    game.addTeam1 team1
    game.addTeam2 team2
    round = new Round game

    round.initialPlayerOrder()
    @spy.should.have.been.calledOnce
