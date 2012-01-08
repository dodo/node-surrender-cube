surrender = require 'surrender'
Cube = require './cube'
{PI, cos, sin} = Math

module.exports = (opts = {}) ->
    opts.from ?= [ [ 0, 3 ], [ 0, 3 ] ]

    cube = new Cube(surrender opts)
    cube.scale(2)

    i = 0
    step = ->
        rad = (i+1) * PI / 180
        i = (++i)%360
        cosa = cos(rad) * 10
        sina = sin(rad) * 10

        cube.rotateX(cosa)
        cube.rotateY(sina)
        cube.rotateZ(sina-cosa)
        do cube.render
    setInterval(step, 100)

