(function() {
  var Bot, CONFIG, directions, game, sum, weighFood, weight, _;
  CONFIG = require('./ants').CONFIG;
  game = require('./ants').Game;
  _ = require('./underscore')._;
  game = new game();
  directions = ['N', 'E', 'S', 'W'];
  sum = function(xs) {
    return _.reduce(xs, (function(x, y) {
      return x + y;
    }), 0);
  };
  weight = function(game, ant, dir) {
    var point, weigh;
    if (direction) {
      point = ant.neighbor(dir);
    } else {
      point = ant;
    }
    if (!game.passable(point.x, point.y)) {
      return 0;
    }
    weigh = function(food) {
      return weighFood(game.distance(point, food));
    };
    return sum(_.map(weigh(game.food())));
  };
  weighFood = function(dist) {
    return 1.0 / dist;
  };
  Bot = (function() {
    function Bot() {}
    Bot.prototype.ready = function() {};
    Bot.prototype.do_turn = function() {
      var ant, dir, my_ants, opportunity, order, _i, _j, _len, _len2, _results;
      my_ants = game.my_ants();
      _results = [];
      for (_i = 0, _len = my_ants.length; _i < _len; _i++) {
        ant = my_ants[_i];
        order = false;
        weight = weigh(game, ant);
        for (_j = 0, _len2 = directions.length; _j < _len2; _j++) {
          dir = directions[_j];
          opportunity = weigh(game, ant, dir);
          if (opportunity >= weight) {
            weight = opportunity;
            order = dir;
          }
        }
        _results.push(order ? ant.order(order) : void 0);
      }
      return _results;
    };
    return Bot;
  })();
  game.run(new Bot());
}).call(this);
