{PI, cos, sin} = Math

class Vector
    constructor: (x=0, y=0, z=0) ->
        [@x, @y, @z] = [x, y, z]

    rotateX: (angle) ->
        rad = angle * PI / 180
        cosa = cos(rad)
        sina = sin(rad)
        y = @y * cosa - @z * sina
        z = @y * sina + @z * cosa
        [@y, @z] = [y, z]
        this

    rotateY: (angle) ->
        rad = angle * PI / 180
        cosa = cos(rad)
        sina = sin(rad)
        z = @z * cosa - @x * sina
        x = @z * sina + @x * cosa
        [@x, @z] = [x, z]
        this

    rotateZ: (angle) ->
        rad = angle * PI / 180
        cosa = cos(rad)
        sina = sin(rad)
        x = @x * cosa - @y * sina
        y = @x * sina + @y * cosa
        [@x, @y] = [x, y]
        this

    project: (width, height, fov, viewer_distance) ->
        factor = fov / (viewer_distance + @z)
        x =  @x * factor + width / 2
        y = -@y * factor + height / 2
        new Vector(x, y, 1)

    mul: (value) ->
        @x *= value
        @y *= value
        @z *= value
        this

# exports

module.exports = Vector
