inShop = {}

function inShop:load()
    simp.load()
    button1 = simp.new_button({
        name = "BACK",
        isVisible = true,
        x = cw/3.5,
        y = ch/1.2,
        w = 200,
        h = 50,
        pressed = function()
            simp.state_switch(inMenu,"inMenu")
        end,
    })
end

function inShop:update(dt)

end

function inShop:draw()
    love.graphics.setColor(0.5,0.6,0.9)
    love.graphics.rectangle("fill",0,0,cw,ch)
    love.graphics.setColor(1,1,1)
    love.graphics.print("SHOP",cw/2.5,ch/4)
    simp.draw()
end

function inShop:mousepressed(x,y,button)
  x, y =  push:toGame(x,y)
  simp.mousepressed(x,y,button)
end

function inShop:mousereleased(x,y,button)
   
end