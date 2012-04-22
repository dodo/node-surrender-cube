{ Animation } = require 'animation'
surrender = require 'surrender'
Cube = require './cube'

module.exports = (opts = {}) ->
    opts.from ?= [ [ 0, 3 ], [ 0, 3 ] ]

    cube = new Cube(surrender opts)
    cube.scale(2)

    animation = new Animation(frame:'80ms')

    # rotation per time
    rot = 1/10 * animation.frametime

    animation.on 'tick', (dt) ->
        c = dt / animation.frametime # tick correction

        cube.rotateX( rot * c)
        cube.rotateZ(-rot * c)
        do cube.render

    animation.start()


