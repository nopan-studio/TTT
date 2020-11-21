local path = (...).."."
object = {}
objects = {}
--
require (path.."player")
require (path.."wall")
require (path.."platform")
--
function object:reset()
    objects = {}
    object.lastX = 0
    object.lastY = 80
    object.lastCount = 0
end

function object:update(dt)
    for _,__ in ipairs(objects) do 
        object.player:update(__)
        object.platform:update(__,_,dt)
        object.wall:update(__)  
    end
end

function object:draw(dt)
    --1st LAYER
    for _,__ in ipairs(objects) do 
        object.platform:draw(__)
        object.wall:draw(__)
    end
    -- 2nd LAYER
    for _,__ in ipairs(objects) do 
        object.player:draw(__)
    end
end

--collision callbacks
function object.beginContact( a, b, coll)
    object.platform:callback( a, b)
end

function object.endContact( a, b, coll)
    --heyhey
end


