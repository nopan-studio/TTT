inSettings = {}

function inSettings:load()
    simp.load()
    button1 = simp.new_button({
        name = "QUIT",
        isVisible = true,
        image = assets.button_back_unactive,
        image_2 = assets.button_back_active,
        x = cw/3.3 + 105,
        y = ch/1.8 + 120,
        w = 77,
        h = 86,
        alpha = 0,
        pressed = function()
            
            end,
        released = function ()
                simp.state_switch(inMenu,"inMenu")
            end,
        update = function(self,dt)
            if self.alpha <= 1 then
                self.alpha = self.alpha + 1 * dt
            end
        end,        
    })
end

function inSettings:update(dt)
    simp.update(dt)
end

function inSettings:draw()
    love.graphics.setColor(0.7,0.7,0.7)
    love.graphics.draw(assets.background,0,0,0,2,2)
    love.graphics.setColor(1,1,1)
    love.graphics.draw(assets.sidewall,0,0,0,2,2)
    love.graphics.draw(assets.sidewall,cw,0,0,-2,2)
    simp.draw()
end

function inSettings:mousepressed(x,y,button)
    x, y =  push:toGame(x,y)
    simp.mousepressed(x,y,button)
end

function inSettings:mousereleased(x,y,button)
    x, y =  push:toGame(x,y)
    simp.mousereleased(x,y,button)
end