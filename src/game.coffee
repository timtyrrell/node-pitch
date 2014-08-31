{Round} = require './round'
_ = require 'underscore'

class Game
  #add name?
  #score
  #winning team
  constructor: ->
    @rounds = []

  start: ->
    throw new Error("Game not Valid.") unless @isValid()
    round = new Round @
    round.initialPlayerOrder()
    @rounds.push round

  isValid: ->
    if @team1? && @team2? then true else false

  addTeam1: (team1) ->
    @team1 = team1

  addTeam2: (team2) ->
    @team2 = team2

  winningScoreReached: ->
    return true if @team1.score > 14 || @team2.score > 14
    false

  firstRound: -> @rounds.length == 1

  currentRound: -> _.last @rounds

  otherTeam: (team) ->
    if team == @team1 then @team2 else @team1

  clockwiseSeatedPlayerFrom: (player) ->
    otherTeam = @otherTeam(player.team)
    return otherTeam.player1 if player == @team1.player1
    return otherTeam.player2 if player == @team1.player2
    return otherTeam.player1 if player == @team2.player1
    return otherTeam.player2 if player == @team2.player2

module.exports.Game = Game
