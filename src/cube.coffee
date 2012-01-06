Vector = require './vector'


# maps Vector to a 2dim list
toList = (vec) ->
    return [vec.x, vec.y]


class Cube
    constructor: (@ctx) ->
        @vertices = [
            new Vector(-1, -1, -1)
            new Vector( 1, -1, -1)
            new Vector(-1,  1, -1)
            new Vector(-1, -1,  1)
            new Vector(-1,  1,  1)
            new Vector( 1, -1,  1)
            new Vector( 1,  1, -1)
            new Vector( 1,  1,  1)
        ]

        @edges = [[0,1], [1,5], [5,3], [3,0] # bottom
                  [2,6], [6,7], [7,4], [4,2] # top
                  [0,2], [1,6], [5,7], [3,4]]

    map: (method, args...) ->
        for vertice in @vertices
            vertice[method](args...)
        this

    _rotate: (type, angle) ->
        @map("rotate#{type}", angle)

    rotateX: (angle) -> @_rotate('X', angle)
    rotateY: (angle) -> @_rotate('Y', angle)
    rotateZ: (angle) -> @_rotate('Z', angle)

    scale: (value) ->
        @map("mul", value)

    render: () ->
        @ctx.charm.reset()
        for edge in @edges
            @ctx.line(toList(@vertices[edge[0]].project(3, 3, 2, 6)),
                      toList(@vertices[edge[1]].project(3, 3, 2, 6)))

# exports

module.exports = Cube

