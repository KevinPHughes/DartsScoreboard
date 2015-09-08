'use strict'
_ = require('underscore')

module.exports = ($scope) ->
    @points =
      1: 0
      2: 0

    @board =
      '20':
        1: 0
        2: 0
      '19':
        1: 0
        2: 0
      '18':
        1: 0
        2: 0
      '17':
        1: 0
        2: 0
      '16':
        1: 0
        2: 0
      '15':
        1: 0
        2: 0
      '50':
        1: 0
        2: 0

    @activePlayer = 1
    @shotsLeft = 3

    @getDisplay = (points) ->
      if points == 0
        0
      else if points == 1
        "/"
      else if points == 2
        "X"
      else
        display = "X "


    addPointsIfNecessary = (position) =>
      inactivePlayer = 2 if @activePlayer == 1
      inactivePlayer = 1 if @activePlayer == 2
      if @board[position][@activePlayer] > 3 && @board[position][inactivePlayer] < 3
        @points[@activePlayer] += parseInt(position)


    switchPlayerIfNecessary = () =>
      if @shotsLeft == 0
        if @activePlayer == 1 then @activePlayer = 2 else @activePlayer = 1
        @shotsLeft = 3

    @score = (position, valueOfShot) =>
      while valueOfShot > 0
        @board[position][@activePlayer] += 1
        addPointsIfNecessary(position)
        valueOfShot -= 1

      @shotsLeft = @shotsLeft - 1
      switchPlayerIfNecessary()

    @endTurn = () =>
      @shotsLeft = 0
      switchPlayerIfNecessary()


    @
