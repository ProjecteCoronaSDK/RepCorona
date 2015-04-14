local composer = require( "composer" )
local physics = require("physics")
physics:start()
local scene = composer.newScene()



local function touchBall( event )
     if event.phase == "began" then
        event.target:setFillColor( math.random(0,1), math.random(0,1),math.random(0,1) )
    end

    return true
end

local function listener( event )
        local cercle = display.newCircle( math.random( 0, _W ), 0, 20 )
        cercle:setFillColor( math.random(0,0.8), math.random(0,0.8),math.random(0,0.8))
        physics.addBody( cercle, { density = 0.1, bounce = 1 } )
        local params = { time = 5000, y = _H-50}
        transition.to( cercle, params )
        cercle:addEventListener( "touch", touchBall )
end



-- "scene:create()"
function scene:create( event )

    local sceneGroup = self.view
    local background = display.newRect( sceneGroup, _centerX, _centerY, _W,_H)
    background:setFillColor( 255/255, 255/255, 255/255 )

    timer.performWithDelay( 1000, listener, 0 )
    local recttop = display.newRect( sceneGroup, 0, 0, _W, 50)
    recttop:setFillColor( 1, 0, 1 )
    recttop.anchorX = 0
    local rectbot = display.newRect( sceneGroup, 0, _H, _W, 50 )
    rectbot:setFillColor( 1, 0, 1 )
    rectbot.anchorY = 1
    rectbot.anchorX = 0
    local rectleft = display.newRect( sceneGroup, 0, _H/2, 50, _H )
    rectleft:setFillColor( 1, 0, 0 )
    rectleft.anchorY = 0.5
    local rectright = display.newRect( sceneGroup, _W, _H/2, 50, _H )
    rectright:setFillColor( 1, 0, 0 )
    rectright.anchorY = 0.5



    rectbot:setFillColor( 1, 0, 1 )
    rectbot.anchorY = 1
    rectbot.anchorX = 0

    physics.addBody( recttop, "static", { density=0.1, friction=0.1, bounce=0.4 } )
    physics.addBody( rectbot, "static", { density=0.1, friction=0.1, bounce=0.4 } )
    physics.addBody( rectleft, "static", { density=0.1, friction=0.1, bounce=0.4 } )
    physics.addBody( rectright, "static", { density=0.1, friction=0.1, bounce=0.4 } )




end






-- "scene:show()"
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
    end
end


-- "scene:hide()"
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end
end


-- "scene:destroy()"
function scene:destroy( event )

    local sceneGroup = self.view

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
end


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene