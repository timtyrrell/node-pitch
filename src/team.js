export class Team {
  constructor(name = 'Unnamed') {
    this.name = name
    this.score = 0
  }

  isValid() {
    return (this.player1 && this.player2) ? true : false
  }

  addPlayer1(player){
    this.player1 = player
    this.player1.team = this
  }

  addPlayer2(player){
    this.player2 = player
    this.player2.team = this
  }
}
