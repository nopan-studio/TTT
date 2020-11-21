math.randomseed(os.time()*math.pi)
--dependencies
require "libs"
require "assets"
require "objects"
require "scenes"
--Coding Goes Here
function love.load()
    --@@ SETUP CANVAS + PUSH
    --canvas = love.graphics.newCanvas()
    windowWidth, windowHeight =love.window.getDesktopDimensions()
    --windowWidth, windowHeight = windowWidth*.2, windowHeight*.5
    windowWidth, windowHeight = windowWidth*.38, windowHeight*.9
    sw, sh = 514,712--windowWidth, windowHeight
    cw,ch = sw,sh
    push:setupScreen(sw, sh, windowWidth, windowHeight, {fullscreen = false, stretched = true, pixelperfect = true, resizable = true})
    --loads sceness
    simp.state_load()
end

function love.resize(w, h)
    push:resize(w, h)
end

function love.update()
    simp.state_update(love.timer.getDelta())
end

function love.draw()
    push:start()
        simp.state_draw()
    push:finish()
end

function love.mousepressed(x,y,button)
    simp.state_mousepressed(x,y,button)
end

function love.mousereleased(x, y ,button)
    simp.state_mousereleased(x,y,button)
end


