'use strict'

module.exports = ($location) ->
    @isLinkable = (title) ->
      $location.url().indexOf(title) < 0

    @


