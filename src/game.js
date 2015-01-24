import {Round} from './round'
var _ = require('underscore')

export class Game {
  // add name?
  // score
  // winning team
  constructor() {
    this.rounds = []
    this.team1 = null
    this.team2 = null
  }

  start() {
    if(!this.isValid()) { throw new Error("Game not Valid.") }
    let round = new Round(this)
    round.initialPlayerOrder()
    this.rounds.push(round)
  }

  isValid() {
    return (this.team1 != null && this.team2 != null) ? true : false
  }

  addTeam1(team1) {
    this.team1 = team1
  }

  addTeam2(team2) {
    this.team2 = team2
  }

  winningScoreReached() {
    return (this.team1.score > 14 || this.team2.score > 14) ? true : false
  }

  firstRound() { return this.rounds.length === 1 }

  currentRound() { return _.last(this.rounds) }

  otherTeam(team){
    return (team === this.team1) ? this.team2 : this.team1
  }

  clockwiseSeatedPlayerFrom(player) {
    let otherTeam = this.otherTeam(player.team)
    if(player === this.team1.player1 || player === this.team2.player1){
      return otherTeam.player1
    } else if(player === this.team1.player2 || player === this.team2.player2){
      return otherTeam.player2
    }
  }
}
