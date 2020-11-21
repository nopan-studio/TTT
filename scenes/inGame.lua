inGame = {}

function inGame:load()
    collectgarbage("collect")
    world = love.physics.newWorld(0, -600)
    world:setCallbacks(object.beginContact, object.endContact, object.preSolve, object.postSolve)
    --
    object:reset()
    --
    object.player:new()
    --
    object.wall:new({x=0,y=player.y,w= 1,h=50})
    object.wall:new({x=sw,y=player.y,w= 1,h=50})
    --
    object.platform:new({x=cw/2,y=8,w=450})

    inGame.y = {
        [1]=0,
        [2]=704,
    }
end

function inGame:update(dt)
    world:update(dt)
    object.platform:spawner()
    inGame:background_overlay_rotation(dt)
    object:update(dt)
    --5:34 AM HELO HELLO
end

function inGame:draw()
    --DRAW GAME CANVAS
    love.graphics.translate(0,sh)
    love.graphics.scale(1,-1)
    love.graphics.setColor(227/255,231/255,236/255)
    love.graphics.rectangle("fill",0,0,cw,ch)
    love.graphics.setColor(0.2,0.2,0.2,0.1)
    love.graphics.rectangle("fill",0,0,cw,ch)
    love.graphics.setColor(1,1,1)
    cam:draw(function(l,t,w,h)
        love.graphics.setColor(0.6,0.6,0.6)
        love.graphics.draw(assets.background,0,inGame.y[1],0,2,2)
        love.graphics.draw(assets.background,sw,inGame.y[1],0,-2,2)

        love.graphics.draw(assets.background,0,inGame.y[2],0,2,2)
        love.graphics.draw(assets.background,sw,inGame.y[2],0,-2,2)
        love.graphics.setColor(1,1,1)
        object:draw()
        love.graphics.draw(assets.sidewall,0,inGame.y[1],0,2,2)
        love.graphics.draw(assets.sidewall,sw,inGame.y[1],0,-2,2)

        love.graphics.draw(assets.sidewall,0,inGame.y[2],0,2,2)
        love.graphics.draw(assets.sidewall,sw,inGame.y[2],0,-2,2)
    end)
    --DRAW OVERLAY
    love.graphics.translate(0,sh)
    love.graphics.scale(1,-1)
    love.graphics.setColor(35/255,32/255,44/255)
    love.graphics.setColor(0.8,0.5,0.5)
    love.graphics.print("SCORE : "..player.max,cw/2-90,104)
    love.graphics.setColor(1,1,1)
    love.graphics.print("SCORE : "..player.max,cw/2-90,100)

end

function inGame:background_overlay_rotation(dt)
    local camX,camY = cam:getVisibleCorners()
    if not simp.aabb({x=camX,y=camY,w=cw,h=ch},{x=0,y=inGame.y[1],w=sw,h=sh}) and player.vx == 0 and player.vy == 0 then -- check if background is in the camera.
        inGame.y[1] = inGame.y[2]
        inGame.y[2] = inGame.y[2] + 704
    end
end

function inGame:mousepressed(x,y,button)
    --nothing to put here
end

function inGame:mousereleased(x,y,button)
    --nothing to put here
end