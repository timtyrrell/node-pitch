var _ = require('underscore')

export class Round {
  //constructor: (@team1, @team2, @previousRound)
  constructor(game) {
    this.game = game
    this.currentOrder = []
  }

  initialPlayerOrder() {
  //   let firstPlayer = _.first(_.shuffle([this.game.team1.player1,
  //                                    this.game.team1.player2,
  //                                    this.game.team2.player1,
  //                                    this.game.team2.player2]))

  //   this.currentOrder.push(firstPlayer)
  //   let secondPlayer = this.game.clockwiseSeatedPlayerFrom(firstPlayer)
  //   this.@currentOrder.push(secondPlayer)
  //   let thirdPlayer = this.game.clockwiseSeatedPlayerFrom(secondPlayer)
  //   this.@currentOrder.push(thirdPlayer)
  //   let fourthPlayer = this.game.clockwiseSeatedPlayerFrom(thirdPlayer)
  //   this.currentOrder.push(fourthPlayer)
  //   return this.currentOrder
  }

  // playerOrder() {
  //   this.currentOrder
  // }

  // team1 ending score
  // team2 ending score
  // bids
  // current high bid and player/team
  // current trump
  // current player dealing
  // bid order?
  // accepts bids for each team/player
  // determines the winning team/player bid
  // previous round info? previous bidder? ...?

  // figure out first bidder
    // if not the first round
    //   finds out who is going to bid
    // else
    //   get random bidder
  // collects the bids
  // figures out the winning bidder player/team
  // tells the game it is valid and to continue?

  // isValid
  // canBegin ?
}
