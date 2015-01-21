import {Game} from '../src/game'
import {Player} from '../src/player'
import {Team} from '../src/team'
import {Round} from '../src/round'
var chai = require('chai')
chai.should()
var sinon = require('sinon')
var sinonChai = require('sinon-chai')
chai.use(sinonChai)

describe("Game", () => {
  context("when checking validitiy", () => {
    it("has 2 teams", () => {
      let game = new Game()
      game.addTeam1(new Team())
      game.addTeam2(new Team())
      game.isValid().should.be.true
    })

    it("must have 2 teams", () => {
      let game = new Game()
      game.addTeam1(new Team(), new Player(), new Player())
      game.isValid().should.be.false
    })

    context("when starting a game", () => {
      it("checks validity", () => {
        let game = new Game()
        let spy = sinon.spy(game, 'isValid')
        try {
          game.start()
        } catch(e)  {
          spy.should.have.been.calledOnce
        }
      })

      it("creates a round", () => {
        let game = new Game()
        let stub = sinon.stub(game, 'isValid').returns(true)
        let initial = sinon.stub(Round.prototype, 'initialPlayerOrder')
        game.start()
        game.rounds.should.have.length(1)
        stub.restore()
        initial.restore()
      })

      it("triggers the initial round player order", () => {
        let game = new Game()
        let stub = sinon.stub(game, 'isValid').returns(true)
        let spy = sinon.stub(Round.prototype, 'initialPlayerOrder')
        game.start()
        spy.should.have.been.calledOnce
        stub.restore()
        return spy.restore()
      })

      it("adds a new team", () => {
        let team1 = new Team()
        let team2 = new Team()
        let game = new Game()
        game.addTeam1(team1)
        game.addTeam2(team2)
        game.team1.should.equal(team1)
        game.team2.should.equal(team2)
      })
    })

    context("when checking if the winning score is reached", () => {
      let team1, team2, game
      beforeEach(() => {
        team1 = new Team()
        team2 = new Team()
        game = new Game()
        game.addTeam1(team1)
        game.addTeam2(team2)
      })

      it("is reached if a team has 15 or more points", () => {
        team1.score = 15
        game.winningScoreReached().should.be.true
      })

      it("is not reached if no team has more than 15 points", () => {
        game.winningScoreReached().should.be.false
      })
    })

    context("when returning round informations", () => {
      let game, firstRound
      beforeEach(() => {
        game = new Game()
        firstRound = new Round()
        game.rounds.push(firstRound)
      })

      it("declares the first round", () => {
        game.firstRound().should.be.true
      })

      it("can return the current round", () => {
        game.currentRound().should.equal(firstRound)
      })
    })
    context("when seeking the other players team", () => {
      it("returns the other players team", () => {
        let team1 = new Team()
        let team2 = new Team()
        let game = new Game()
        game.addTeam1(team1)
        game.addTeam2(team2)

        game.otherTeam(team1).should.equal(team2)
        game.otherTeam(team2).should.equal(team1)
      })
    })
    context("when seeking the clockwise seated player", () => {
      it("returns the player", () => {
        let player1 = new Player("p1")
        let player2 = new Player("p2")
        let player3 = new Player("p3")
        let player4 = new Player("p4")
        let team1 = new Team("Team1")
        team1.addPlayer1(player1)
        team1.addPlayer2(player2)
        let team2 = new Team("Team2")
        team2.addPlayer1(player3)
        team2.addPlayer2(player4)
        let game = new Game()
        game.addTeam1(team1)
        game.addTeam2(team2)

        game.clockwiseSeatedPlayerFrom(player1).should.equal(player3)
        game.clockwiseSeatedPlayerFrom(player2).should.equal(player4)
        game.clockwiseSeatedPlayerFrom(player3).should.equal(player1)
        game.clockwiseSeatedPlayerFrom(player4).should.equal(player2)
      })
    })
    // context.only "when dealing cards", ->
    //   before -> @game = new Game

    //   it "gives 6 cards", ->
    //     @game.dealCards()

    //   it "removes 6 cards from the deck"
  })
})
