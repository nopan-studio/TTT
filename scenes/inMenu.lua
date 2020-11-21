inMenu = {}

function inMenu:load()
    collectgarbage("collect")
    --load simp buttons vars
    simp.load()
    button1 = simp.new_button({
        name = "START",
        isVisible = true,
        image = assets.button_start_unactive,
        image_2 = assets.button_start_active,
        x = cw/3.3,
        y = ch/1.8 + 120,
        w = 200,
        h = 100,
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

    --[[
    button2 = simp.new_button({
        name = "SETTINGS",
        isVisible = true,
        image = assets.button_settings_unactive,
        image_2 = assets.button_settings_active,
        x = cw/3.3 + 15,
        y = ch/1.8 + 120,
        w = 77,
        h = 86,
        alpha = 0,
        pressed = function()
           --
        end,
        released = function()
            simp.state_switch(inSettings,"inSettings")
        end,
        update = function(self,dt)
            if self.alpha <= 1 then
                self.alpha = self.alpha + 1 * dt
            end

        end,
    })
    ]]
    
    --[[
    button3 = simp.new_button({
        name = "QUIT",
        isVisible = true,
        image = assets.button_exit_unactive,
        image_2 = assets.button_exit_active,
        x = cw/3.3 + 210,
        y = ch/1.8 + 125,
        w = 77,
        h = 86,
        alpha = 0,
        pressed = function()
            
            end,
        released = function ()
                love.event.quit()
            end,
        update = function(self,dt)
            if self.alpha <= 1 then
                self.alpha = self.alpha + 1 * dt
            end
            --
        end,
    })
    ]]

end

function inMenu:update(dt)
    --for now nothin
    simp.update(dt)
end

function inMenu:draw()
    love.graphics.setColor(0.7,0.7,0.7)
    love.graphics.draw(assets.background,0,0,0,2,2)
    love.graphics.setColor(1,1,1)
    love.graphics.draw(assets.sidewall,0,0,0,2,2)
    love.graphics.draw(assets.sidewall,cw,0,0,-2,2)
    love.graphics.setColor(0.0,0.0,0.0,button1.alpha/3)
    love.graphics.draw(assets.title,cw/60,ch/10 + 30 ,0,2,2)
    love.graphics.setColor(1,1,1,button1.alpha)
    love.graphics.draw(assets.title,cw/60,ch/10 ,0,2,2)
    simp.draw()
end

function inMenu:mousepressed(x,y,button)
    x,y = push:toGame(x,y)
    simp.mousepressed(x,y,button)
end

function inMenu:mousereleased(x,y,button)
    x,y = push:toGame(x,y)
    simp.mousereleased(x,y,button)
end