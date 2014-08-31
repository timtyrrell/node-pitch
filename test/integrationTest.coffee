{Game} = require '../src/game'
{Player} = require '../src/player'
{Team} = require '../src/team'
{Round} = require '../src/round'
chai = require 'chai'
chai.should()
_ = require 'underscore'

describe "Playing a real game", ->
  it "works", ->
    p1 = new Player "Tim"
    p2 = new Player "Bart"
    p3 = new Player "Adam"
    p4 = new Player "Ben"

    team1 = new Team "Awesome people"
    team1.addPlayer1 p1
    team1.addPlayer2 p2

    team2 = new Team "Cool people"
    team2.addPlayer1 p3
    team2.addPlayer2 p4

    game = new Game

    game.addTeam1 team1
    game.addTeam2 team2

    game.start()

    while !game.winningScoreReached()
      if !game.firstRound()
        currentRound = game.newRound()
      else
        currentRound = game.currentRound()
      playerOrder = currentRound.playerOrder()

      _.each playerOrder, (player) ->
        player.receiveCards game.dealCards()

      initialBid = 2
      _.each playerOrder, (player) ->
        currentRound.acceptBid player, initialBid++

      currentRound.declareBidWinner()

      currentRound.acceptTrump SUITE::HEARTS #must be from winning bidder

      currentRound.cardPlayed p1.play(p1.cards[0])
      currentRound.cardPlayed p3.play(p3.cards[2])
      currentRound.cardPlayed p2.play(p2.cards[1])
      currentRound.cardPlayed p4.play(p4.cards[0])

      currentRound.calculateScores()

    #output winner
    game.winningTeam
    game.score
