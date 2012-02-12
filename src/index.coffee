{ Animation } = require 'animation'
surrender = require 'surrender'
Cube = require './cube'
{PI, cos, sin, max} = Math

module.exports = (opts = {}) ->
    opts.from ?= [ [ 0, 3 ], [ 0, 3 ] ]
    i = 0

    cube = new Cube(surrender opts)
    cube.scale(2)

    animation = new Animation(frame:'100ms')
    animation.on 'tick', (dt) ->

        rad = (i+1) * PI / 180
        i = (++i)%360
        cosa = cos(rad) * 10
        sina = sin(rad) * 10

        cube.rotateX(cosa)
        cube.rotateY(sina)
        cube.rotateZ(sina-cosa)
        do cube.render

    animation.start()


