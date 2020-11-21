
font = love.graphics.newFont("assets/riskofrainsquare.ttf",30)
love.graphics.setFont(font)

assets = {
    love.graphics.setDefaultFilter("linear","linear",1),
    --character
    player = love.graphics.newImage("assets/TTT-Player.png"), 
    --plats
    platform = love.graphics.newImage("assets/TTT-Plats.png"),
    --button
    button_start_unactive = love.graphics.newImage("assets/TTT-button-start-unactive.png"),
    button_start_active = love.graphics.newImage("assets/TTT-button-start-active.png"),
    button_settings_unactive = love.graphics.newImage("assets/TTT-button-settings-unactive.png"),
    button_exit_unactive = love.graphics.newImage("assets/TTT-button-exit-unactive.png"),
    button_back_unactive = love.graphics.newImage("assets/TTT-button-back-unactive.png"),
    button_restart_unactive = love.graphics.newImage("assets/TTT-button-restart-unactive.png"),
    button_restart_active = love.graphics.newImage("assets/TTT-button-restart-active.png"),
    button_settings_active = love.graphics.newImage("assets/TTT-button-settings-active.png"),
    button_exit_active = love.graphics.newImage("assets/TTT-button-exit-active.png"),
    button_back_active = love.graphics.newImage("assets/TTT-button-back-active.png"),
    --etcs
    sidewall = love.graphics.newImage("assets/TTT-Sidewall.png"),
    background = love.graphics.newImage("assets/TTT-Background.png"),
    title = love.graphics.newImage("assets/TTT-Title.png"),
}   
 