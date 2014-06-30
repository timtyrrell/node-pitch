class Team
  constructor: (@player1, @player2) ->

  isValid: ->
    if @player1? && @player2? then true else false

module.exports.Team = Team
