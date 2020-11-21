object.wall = {}

function object.wall:new(params)
    local wall = {}
     wall.name = "wall"
    wall.xFixed = params.x
    wall.x = params.x
    wall.y = params.y
    wall.w = params.w
    wall.h = params.h
    --
    wall.physics = {}
    wall.physics.body = love.physics.newBody( world, wall.x,wall.y,"static")
    wall.physics.shape = love.physics.newRectangleShape( wall.w, wall.h)
    wall.physics.fixture = love.physics.newFixture( wall.physics.body, wall.physics.shape)
    wall.physics.body:setFixedRotation(true)
    wall.physics.fixture:setRestitution(0.9)
    wall.physics.fixture:setFriction(0)
    wall.physics.fixture:setUserData("wall")
    -- 
    table.insert( objects, wall)
end

function object.wall:update(object,dt)
    if object.name == "wall" then
        object.physics.body:setX(object.xFixed)
        object.physics.body:setY(player.y)
    end
end

function object.wall:draw(object)
    if object.name == "wall" then
        love.graphics.polygon("line",object.physics.body:getWorldPoints(object.physics.shape:getPoints()))
    end
end
 










