object.platform = {}

function object.platform:new(params)
    local plat = {} 
    --
    plat.no = object.lastCount
    plat.name = "platform"
    plat.x = params.x
    plat.y = params.y
    plat.w = params.w
    plat.h = 30
    plat.alpha = 0
    --
    plat.image = assets.platform
    plat.quad = love.graphics.newQuad(0,0,500,20,plat.image:getDimensions())
    --
    plat.physics = {}
    plat.physics.body = love.physics.newBody(world,plat.x,plat.y,"static")
    plat.physics.shape = love.physics.newRectangleShape(plat.w, plat.h)
    plat.physics.fixture = love.physics.newFixture(plat.physics.body,plat.physics.shape)
    plat.physics.body:setFixedRotation(true)
    plat.physics.fixture:setFriction(1)
    plat.physics.fixture:setRestitution(.5)
    plat.physics.fixture:setUserData("platform")
    plat.physics.body:setUserData(plat.no)
    --
    table.insert(objects,plat)
    --
    object.lastCount = object.lastCount + 1
    return plat
end

function object.platform:spawner()
    while #objects < 50 do
        --
        local width = math.random(1,3)
        local widths = {
            [1] = 90,
            [2] = 140,
            [3] = 180,
        }
        width = widths[width]

        local pos = {
            {x = windowWidth / 1.3},
            {x = windowWidth / 2},
            {x = windowWidth / 4},
        }

        for _,__ in ipairs(pos) do
            if object.lastX == _ then
                table.remove(pos,_)
            end
        end

        object.lastX = math.random(1,#pos)

        local plat = object.platform:new({x = pos[object.lastX].x, y = object.lastY ,w = width}) 
        for _,__ in ipairs(objects) do
            if __.name == "platform" then
                while(plat.no-1 ==  __.no and plat.physics.body:getX() == __.physics.body:getX()) do
                    local rand = math.random(1,2)
                    if rand == 1 and object.lastX ~= 2 then
                        plat.physics.body:setX(pos[object.lastX+1].x)
                    elseif rand == 2 and object.lastX ~= 1 then
                        plat.physics.body:setX(pos[object.lastX-1].x)
                    end
                end
            end
        end
        object.lastY  = object.lastY  + 80
        --
    end
end

function object.platform:update(object,_,dt)
    if object.name == "platform" then
        
        --sets quad viewport 
        if object.w == 90 then
            object.quad = love.graphics.newQuad(0,0,500,50,object.image:getDimensions())
        elseif object.w == 140 then
            object.quad = love.graphics.newQuad(500,0,500,50,object.image:getDimensions())
        elseif object.w == 180 then
            object.quad = love.graphics.newQuad(500*2,0,500,50,object.image:getDimensions())
        elseif object.w == 450 then
            object.quad = love.graphics.newQuad(500*3,0,500,50,object.image:getDimensions())
        end
        --
        if player.y > object.physics.body:getY() or object.no < player.current + 5 then
            if object.alpha < 1 and player.current <= object.no then
                object.alpha = object.alpha + 1 * dt
            end
        end
        --
        if player.y <= object.physics.body:getY()+20 then 
            object.physics.fixture:setGroupIndex(-1) 
        else 
            object.physics.fixture:setGroupIndex(1) 
        end
        --
        if player.current > object.no and player.vy == 0 and player.vx == 0  then
            object.alpha = object.alpha - 3 * dt
            if object.alpha < 0 then
                object.physics.body:destroy()
                table.remove(objects,_)
            end
        end
    end
end

function object.platform:draw(object)
    if object.name == "platform" then
        --[[
        love.graphics.setColor(0,0,0)
        love.graphics.polygon("line",object.physics.body:getWorldPoints(object.physics.shape:getPoints()))
        love.graphics.setColor(1,1,1)
        --]]
        local camX,camY = cam:getVisibleCorners()
        if simp.aabb({x=camX,y=camY,w=cw,h=ch},{x=object.physics.body:getX(),y=object.physics.body:getY(),w=object.w,h=object.h}) then -- draw the platforms that is in the camera.
            love.graphics.setColor(1,1,1,object.alpha)
                love.graphics.draw(object.image,object.quad,object.physics.body:getX()-object.w/2-3,object.physics.body:getY()+object.h/2+13,0,1,-1)
            love.graphics.setColor(1,1,1,1)
        end
    end
end

function object.platform:callback( a, b, object)
    if a:getUserData() == "player" and b:getUserData() == "platform" then
        local p = a:getBody()
        local platform = b:getBody()
        if p:getY() > platform:getY()then
            player.current = platform:getUserData()
        end
    elseif b:getUserData() == "player" and a:getUserData() == "platform" then
        local p = b:getBody()
        local platform = a:getBody()
        if p:getY() > platform:getY()then
            player.current = platform:getUserData()
        end
    end
end