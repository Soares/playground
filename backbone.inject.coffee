Backbone.inject = (parent, finished) ->
    pctor = -> @constructor = parent
    pctor.prototype = finished.prototype
    parent.prototype = new pctor
    parent.__super__ = finished.__super__

    fctor = -> @constructor = finished
    fctor.prototype = parent.prototype
    finished.prototype = new fctor
    finished.__super__ = parent.prototype
    return finished
