class Team
  constructor: (@name = "Unnamed") ->
    @score = 0

  isValid: ->
    if @player1? && @player2? then true else false

  addPlayer1: (player) ->
    @player1 = player
    @player1.team = @

  addPlayer2: (player) ->
    @player2 = player
    @player2.team = @

module.exports.Team = Team
