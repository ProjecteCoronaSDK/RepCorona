local composer = require( "composer" )

local scene = composer.newScene()

local widget = require( "widget")

local function listenerJinx(event)

    if event.phase == "began" then
        -- local txt = display.newText( "comença el listener" , 0, _H - 100,  native.systemFont, 20 )
        --txt:setFillColor( 200/255, 50/255, 50/255 )
        --txt.anchorX = 0
        elseif event.phase == "ended" then
       -- local txt = display.newText( "acaba el listener", 100, 40,  native.systemFont, 20 )
        --txt:setFillColor( 200/255, 50/255, 50/255 )
        local music = audio.loadSound( "sounds/GetJinxed.mp3")
        audio.play( music )

    end
end

local function pauseMusic( event )
    if (event.phase == "ended") then
    audio.pause( music )
end
end

local function resumeMusic( event )
    if (event.phase == "ended") then
    audio.resume( music )
end
end

function scene:create( event )

    local sceneGroup = self.view
    local bg = display.newRect( sceneGroup, _centerX, _centerY, _W, _H )
    local jinx = display.newImage(  sceneGroup, "img/jinx.jpg" , display.contentCenterX, display.contentCenterY)
    jinx.width = _W
    jinx.height = 200
    local button1 = widget.newButton
    {
    left = 10,
    top = 300,
    id = "button1",
    defaultFile = "img/pause.png",
    overFile = "img/pause.png",
    onEvent = pauseMusic
}
button1.width = 50
button1.height = 50
button1:setFillColor( 1, 0.2, 0.2, 1 )

local button2 = widget.newButton
{
    left = 90,
    top = 350,
    defaultFile = "img/resume.png",
    overFile = "img/resume.png",
    id = "button1",
    label = "Resume",
    onEvent = resumeMusic
}
    --propietats del button2:
    button2.width = 100
    button2.height = 50

    jinx.anchorX = 0.5
    jinx.x = _centerX
    jinx:addEventListener( "touch", listenerJinx )


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
