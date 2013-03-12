-->add physics
local physics = require("physics")

physics.start()

physics.setGravity(0, 9.8)
--physics.setDrawMode("hybrid")


system.activate("multitouch")


--> add background image
local background = display.newImage ("ExFundo.png")




function createBalloons(h, v)
    for i = 1, h do
        for j = 1, v do
            local balloon = display.newImage("ExBalao.png", 300 + (i * 20), 120 + (j * 30))
            balloon.name = "ExBalao.png"
            physics.addBody(balloon)
            balloon.bodyType = "static"
            table.insert(balloons, balloon)
        end
    end
    -- Set balloon counter
    targetTF.text = #balloons
end









--> criar as paredes para limitar o espaco dos baloes
local lefWall = display.newRect(0, 0, 1, display.contentHeight)
local rightWall = display.newRect(display.contentWidth, 0, 1, display.contentHeight)
local celling = display.newRect(0, 0, display.contentWidth, 1)

--> torna as paredes e corpos fisicos
physics.addBody(lefWall, "static", {bounce = 0.1})
physics.addBody(rightWall, "static", {bounce = 0.1})
physics.addBody(celling, "static", {bounce = 0.1})


--> add a image que sera o chao do jogo
local floor = display.newImage ("chao.png")
floor.y = display.contentHeight - floor.stageHeight/2
physics.addBody(floor, "static", {bounce =0.1, friction = 1.0})

--> esconder o status bar
display.setStatusBar(display.HiddenStatusBar)

function moveBalloon(event)
	local balloon = event.target
	balloon:applyLinearImpulse(-0.002, -0.2, event.x, event.y)
end

balloon:addEventListener("touch", moveBalloon)
balloon2:addEventListener("touch", moveBalloon)
balloon3:addEventListener("touch", moveBalloon)
balloon4:addEventListener("touch", moveBalloon)