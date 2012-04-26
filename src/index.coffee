{ Animation } = require 'animation'
surrender = require 'surrender'
Cube = require './cube'
{ PI, sin } = Math

module.exports = (opts = {}) ->
    opts.from ?= [ [ 0, 3 ], [ 0, 3 ] ]
    s = 1.5

    cube = new Cube(surrender opts)
    cube.scale(s)

    animation = new Animation(frame:'66ms')

    # rotation per time
    rot = 1/10 * animation.frametime
    # scale per time
    scl = 1/300 * animation.frametime
    i = 0

    animation.on 'tick', (dt) ->
        return if dt < 3 # skip the first ticks
        c = dt / animation.frametime # tick correction

        cube.rotateX( rot * c)
        cube.rotateZ(-rot * c)

        i = (i+scl*c)%(2*PI)
        _s = s + sin(i)*0.7*scl
        cube.scale(_s/s)
        s = _s

        do cube.render

    animation.start()


