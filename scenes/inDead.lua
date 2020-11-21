inDead = {}

function inDead:load()
    simp.load()
    button1 = simp.new_button({
        name = "RETRY",
        isVisible = true,
        image = assets.button_restart_unactive,
        image_2 = assets.button_restart_active,
        x = cw/3.3+16,
        y = ch/1.8 + 100,
        w = 77,
        h = 86,
        alpha = 0,
        pressed = function()
            end,

        released = function()
                simp.state_switch(inGame,"inGame")
            end,
        update = function(self,dt)
            if self.alpha <= 1 then
                self.alpha = self.alpha + 1 * dt
            end
        end,        
    })

    button2 = simp.new_button({
        name = "Back",
        isVisible = true,
        image = assets.button_back_unactive,
        image_2 = assets.button_back_active,
        x = cw/3.3 + 105,
        y = ch/1.8 + 100,
        w = 77,
        h = 86,
        alpha = 0,
        pressed = function()
            end,

        released = function()
                simp.state_switch(inMenu,"inMenu")
            end,
        update = function(self,dt)
            if self.alpha <= 1 then
                self.alpha = self.alpha + 1 * dt
            end
        end,
    })

    --set filter
    
end

function inDead:update(dt)
    --nothin
    simp.update(dt)
end

function inDead:draw()
    love.graphics.setColor(0.7,0.7,0.7)
    love.graphics.draw(assets.background,0,0,0,2,2)
    love.graphics.setColor(1,1,1)
    love.graphics.draw(assets.sidewall,0,0,0,2,2)
    love.graphics.draw(assets.sidewall,cw,0,0,-2,2)
    love.graphics.setColor(0.8,0.5,0.5)
    love.graphics.print("GAME OVER",(cw/3)-13,(ch/2)-100)
    love.graphics.print("SCORE : "..player.max,(cw/3)+2,(ch/2)-10)
    love.graphics.setColor(1,1,1)
    love.graphics.print("GAME OVER",(cw/3)-13,(ch/2)-104)
    love.graphics.print("SCORE : "..player.max,(cw/3)+2,(ch/2)-14)
    simp.draw()
end

function inDead:mousepressed(x,y,button)
    x,y = push:toGame(x,y)
    simp.mousepressed(x,y,button)
end

function inDead:mousereleased(x,y,button)
    x,y = push:toGame(x,y)
    simp.mousereleased(x,y,button)
end