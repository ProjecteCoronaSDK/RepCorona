
local composer = require( "composer" )
local scene = composer.newScene()
local widget = require ("widget")

--||||||||||||||||| CREATE ||||||||||||||||||||
function scene:create( event )
    print (" >> empieza el juego menu jocs")

    local sceneGroup = self.view
    local background = display.newImageRect( sceneGroup, "img/inicio.png", _W, _H )
    background.x = _centerX
    background.y = _centerY

    --BOTON1
    local button = widget.newButton{
        x = _centerX,
        y = _centerY-100,
        label = "Joc1",
        shape = "roundedRect",
        width = 600,
        height = 150,
        --fillColor = { default={ 1, 0, 0, 1 }, over={ 1, 0.1, 0.7, 0.4 } },
        onRelease = function() 
                            print (">>> clic EN JOC1")
                            composer.gotoScene( "sceneComida" ) 
                    end
    }
    --button:setFillColor( 0,0,0 )
    sceneGroup:insert( button)
    print ("> hemos creado el boton Joc1")

    --BOTON2
     local button = widget.newButton{
        x = _centerX,
        y = _centerY+210,
        label = "Joc2",
        shape = "roundedRect",
        width = 600,
        height = 150,
        --fillColor = { default={ 1, 0, 0, 1 }, over={ 1, 0.1, 0.7, 0.4 } },
        onRelease = function()composer.gotoScene( "pantalla3" ) end
    }
    --button:setFillColor( 0,0,0 )
    sceneGroup:insert( button)
     print ("> hemos creado el boton Joc2")

    --BOTON3
     local button = widget.newButton{
        x = _centerX,
        y = _centerY+500,
        label = "Joc3",
        shape = "roundedRect",
        width = 600,
        height = 150,
        --fillColor = { default={ 1, 0, 0, 1 }, over={ 1, 0.1, 0.7, 0.4 } },
        onRelease = function()composer.gotoScene( "pantalla4" ) end
    }
    --button:setFillColor( 0,0,0 )
    sceneGroup:insert( button)
    print ("> hemos creado el boton Joc3")
    print (">>> hemos CREADO LA ESCENA DE LA PANTALLA 1")


end 
--|||||||||||||| FIN CREATE ||||||||||||||||||||



-- //////////////////////////////////////////////////--

-- "scene:show()"
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        
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