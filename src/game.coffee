class Game
  constructor: (@team1, @team2) ->

  start: ->
    @isValid()

  isValid: ->
    if @team1? && @team2? then true else false

module.exports.Game = Game
