object.player = {}

function object.player:load()
    player = { x=0, y=10, w=0, h=0, current = 0, max = 0, vx, vy}
    cam = gamera.new(0,0,cw,100000*100000)
    cam:setWindow(0,0,cw,ch)
    cam:setScale(1)
end

function object.player:new()
    local player = {}
    --
    player.image = assets.player
    player.image:setFilter("nearest", "nearest")
    player.quad = love.graphics.newQuad(0,0,32,32,player.image:getDimensions())
    --
    player.name ="player"
    player.x = cw/2 
    player.y = 100
    player.w = 16
    player.h = 32
    --s
    player.jumpPower = 0
    player.jumpPowerMax = 800
    player.direction = nil
    player.next = {x=0,y=0} 
    --
    player.physics = {}
    player.physics.body = love.physics.newBody( world, player.x, player.y, "dynamic")
    player.physics.shape = love.physics.newRectangleShape(player.w, player.h)
    player.physics.fixture = love.physics.newFixture( player.physics.body, player.physics.shape,0)
    player.physics.fixture:setRestitution(0.1)
    player.physics.fixture:setUserData("player")
    player.physics.fixture:setGroupIndex(-1)
    --
    table.insert(objects,player)
    object.player:load()
end

function object.player:update( object, dt)
    if object.name == "player" then
        player.vx,player.vy = object.physics.body:getLinearVelocity()
        --
        if love.keyboard.isDown("space") and player.vy == 0 or love.mouse.isDown(1) and player.vy == 0 then 
            object.quad:setViewport(32*1,0,32,32)
            if object.jumpPower < object.jumpPowerMax then
                object.jumpPower = object.jumpPower + 10
            end
        else
            object.quad:setViewport(0,0,32,32)
            if object.direction == "right" then
                object.physics.body:applyLinearImpulse(object.jumpPower / 1.8,object.jumpPower)
            elseif object.direction == "left" then
                object.physics.body:applyLinearImpulse((object.jumpPower * -1) / 1.8,object.jumpPower)
            end
            object.jumpPower = 0
        end
        --
        for _,__ in ipairs(objects) do
            if __.name == "platform" and __.no == player.current + 1 then
                object.next = {x = __.physics.body:getX(), y = __.physics.body:getY()}
            end
        end
        --
        if object.next.x > object.physics.body:getX() then
            object.direction = "right"
        elseif object.next.x < object.physics.body:getX() then
            object.direction = "left"
        end
        --
        player.x,player.y = object.physics.body:getPosition()
        --
        if player.vy ~= 0 then
            object.quad:setViewport(32*2,0,32,32)
        else
            if player.max <= player.current then player.max = player.current end
        end

        --CAMERA
        local cam_smoothing = 20
        local cam_target_x = player.x
        local cam_target_y = player.y + 100
        cam.x = ((cam.x) * (cam_smoothing-1) + cam_target_x) / cam_smoothing 
        cam.y = ((cam.y) * (cam_smoothing-1) + cam_target_y) / cam_smoothing
        cam:setPosition(cam.x,cam.y)

        --auto resets game placeboo
        if player.vy < -900 then
            simp.state_switch(inDead,"inDead")
        end
    end
end

function object.player:draw(object)
    if object.name == "player" then
        --[[
        love.graphics.setColor(0.9,0.3,0.3)
        love.graphics.polygon("line",object.physics.body:getWorldPoints(object.physics.shape:getPoints())) -- placeboo
        love.graphics.setColor(1,1,1,1)
        --]]
        if object.direction == "right" then
            love.graphics.draw(object.image,object.quad,object.physics.body:getX()-object.w,object.physics.body:getY()+object.h/2,0,1,-1)
        elseif object.direction == "left" then
            love.graphics.draw(object.image,object.quad,object.physics.body:getX()+object.w,object.physics.body:getY()+object.h/2,0,-1,-1)
        end
        --POWER BAR ABOVE PLAYER
        if player.vy == 0 then
            if object.jumpPower > 700 then 
                love.graphics.setColor(0.9,0.3,0.3)
            elseif object.jumpPower > 400 then
                love.graphics.setColor(0.9,0.5,0.3)
            elseif object.jumpPower > 100 then
                love.graphics.setColor(0.3,0.9,0.3)
            end
            love.graphics.rectangle("fill",object.physics.body:getX()-object.w-3,object.physics.body:getY()+object.h/2,object.jumpPower/20,10)
            love.graphics.setColor(0.0,0.05,0.05)
            love.graphics.rectangle("line",object.physics.body:getX()-object.w-3,object.physics.body:getY()+object.h/2,object.jumpPowerMax/20,10)
            love.graphics.setColor(1,1,1)
        end
    end
end