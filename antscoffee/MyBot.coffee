CONFIG = require('./ants').CONFIG
game = require('./ants').Game
_ = require('./underscore')._
game = new game()

directions = ['N', 'E', 'S', 'W']

sum = (xs) -> _.reduce xs, ((x, y) -> x + y), 0

weigh = (game, ant, dir) ->
	if dir then point = ant.neighbor(dir)
	else point = ant
	return 0 unless game.passable(point.x, point.y)
	weight = (food) -> weighFood(pathLength(game, point, food))
	return sum(_.map weight, game.food())

weighFood = (dist) -> if dist < 10 then 1.0 / dist else 0

class Bot
	# You can setup stuff here, before the first turn starts:
	ready: ->

	# Here are the orders to the ants, executed each turn:
	do_turn: ->
		my_ants = game.my_ants()
		for ant in my_ants
			order = false
			weight = 0 # weigh(game, ant)
			for dir in directions
				opportunity = weigh(game, ant, dir)
				if opportunity >= weight
					weight = opportunity
					order = dir
			if order then ant.order(order)

game.run new Bot()
