'use strict'
_ = require('underscore')

module.exports = () ->
    @points =
      1: 301
      2: 301

    @alerts =
      1: []
      2: []

    @shotHistory = []

    @activePlayer = 1
    @shotsLeft = 3
    @round = 1

    @score = (position, valueOfShot) =>
      shotDescription = generateAlert(position, valueOfShot)

      shot = {position: position, valueOfShot: valueOfShot, player: @activePlayer, round: @round, description: shotDescription}
      @shotHistory.push(shot)

      while valueOfShot > 0
        @points[@activePlayer] -= parseInt(position)
        valueOfShot -= 1

      if @points[@activePlayer] < 0
        @points[@activePlayer] = @originalScoreForRound
        return @endTurn()

      if @points[@activePlayer] == 0
        @gameOverMessage = "Player #{@activePlayer} wins!!"

      @shotsLeft = @shotsLeft - 1
      switchPlayerIfNecessary()

    @endTurn = () =>
      @shotsLeft = 0
      switchPlayerIfNecessary()

    @undoShot = () =>
      lastShot = @shotHistory.pop()
      if lastShot.player != @activePlayer
        @activePlayer = lastShot.player
        @shotsLeft = 1

        if @alerts[@activePlayer].length == 0
          alertsToDisplay = @shotHistory.slice(Math.max(@shotHistory.length - 2))
          _.each(alertsToDisplay, (shot) =>
            @alerts[@activePlayer].push(shot.description)
          )

      else
        @shotsLeft += 1

      @alerts[@activePlayer].pop()
      @points[@activePlayer] += (lastShot.position * lastShot.valueOfShot)


    switchPlayerIfNecessary = () =>
      if @shotsLeft == 0
        if @activePlayer == 1
          @activePlayer = 2
        else
          @activePlayer = 1
          @round += 1
        @alerts[@activePlayer] = []
        @shotsLeft = 3
        @originalScoreForRound = @points[@activePlayer]

    generateAlert = (position, valueOfShot) =>
      shotDescription = ""
      shotDescription = "Double " if valueOfShot == 2
      shotDescription = "Triple " if valueOfShot == 3
      shotDescription += position
      @alerts[@activePlayer].push(shotDescription)
      shotDescription


    @
