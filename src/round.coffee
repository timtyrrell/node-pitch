_ = require 'underscore'

class Round
  # constructor: (@team1, @team2, @previousRound)
  constructor: (@game) ->

  initialPlayerOrder: ->
    @currentOrder = []
    firstPlayer = _.first(_.shuffle([@game.team1.player1,
                                     @game.team1.player2,
                                     @game.team2.player1,
                                     @game.team2.player2]))

    @currentOrder.push firstPlayer
    secondPlayer = @game.clockwiseSeatedPlayerFrom(firstPlayer)
    @currentOrder.push secondPlayer
    thirdPlayer = @game.clockwiseSeatedPlayerFrom(secondPlayer)
    @currentOrder.push thirdPlayer
    fourthPlayer = @game.clockwiseSeatedPlayerFrom(thirdPlayer)
    @currentOrder.push fourthPlayer
    @currentOrder

  playerOrder: ->
    @currentOrder

  #team1 ending score
  #team2 ending score
  #bids
  #current high bid and player/team
  #current trump
  #current player dealing
  #bid order?
  #accepts bids for each team/player
  #determines the winning team/player bid
  #previous round info? previous bidder? ...?

  #figure out first bidder
    #if not the first round
      #finds out who is going to bid
    #else
      #get random bidder
  #collects the bids
  #figures out the winning bidder player/team
  #tells the game it is valid and to continue?

  #isValid
  #canBegin ?
module.exports.Round = Round
