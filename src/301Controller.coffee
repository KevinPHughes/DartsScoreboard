'use strict'
_ = require('underscore')

module.exports = () ->
    @board = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '50']
    @points =
      1: 301
      2: 301

    @alerts =
      1: []
      2: []

    @activePlayer = 1
    @shotsLeft = 3

    @score = (position, valueOfShot) =>
      originalScore = @points[@activePlayer]
      generateAlert(position, valueOfShot)
      while valueOfShot > 0
        @points[@activePlayer] -= parseInt(position)
        valueOfShot -= 1

      if @points[@activePlayer] < 0
        @points[@activePlayer] = originalScore
        return @endTurn()

      if @points[@activePlayer] == 0
        @gameOverMessage = "Player #{@activePlayer} wins!!"

      @shotsLeft = @shotsLeft - 1
      switchPlayerIfNecessary()

    @endTurn = () =>
      @shotsLeft = 0
      switchPlayerIfNecessary()

    switchPlayerIfNecessary = () =>
      if @shotsLeft == 0
        @alerts[@activePlayer] = []
        if @activePlayer == 1 then @activePlayer = 2 else @activePlayer = 1
        @shotsLeft = 3

    generateAlert = (position, valueOfShot) =>
      valueOfShotDescription = ""
      valueOfShotDescription = "Double " if valueOfShot == 2
      valueOfShotDescription = "Triple " if valueOfShot == 3
      @alerts[@activePlayer].push(valueOfShotDescription + position)

    @
