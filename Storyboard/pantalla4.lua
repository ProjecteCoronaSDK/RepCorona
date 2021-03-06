
local composer = require( "composer" )
local scene = composer.newScene()
local widget = require ("widget")
local temps = 5
local numero


--||||||||||||||||| CREATE ||||||||||||||||||||
function scene:create( event )

    local sceneGroup = self.view
    local background = display.newImageRect( sceneGroup, "img/joc3.png", _W, _H )

  --musica
    print (" >> empieza a sonar musica en joc1")
    sonarMusica()--llama a la funcion 

    background.x = _centerX
    background.y = _centerY


    --BOTON BACK Y PAUSE MUSICA
    local button = widget.newButton{
        x = _centerX,
        y = _centerY+220,
        label = "Back",
        shape = "roundedRect",
        width = 200,
        height = 40,
        fillColor = { default={ 1, 0, 0, 1 }, over={ 1, 0.1, 0.7, 0.4 } },
        onRelease = function() myfunction() end
    }
    button:setFillColor( 0,0,0 )
    sceneGroup:insert( button )
    print (" >> hemos creado el boton Back pantalla joc3")

    --CRONO
    timer.performWithDelay( 1000, listenerCronometre, temps )
    numero = display.newText(sceneGroup, "", 120, 20, native.systemFont, 20 )
    numero:setFillColor( 0,0,0 )
   
end
--||||||||||||||||| FIN CREATE ||||||||||||||||||||


--||||||||||||||||||||FUNCIONES|||||||||||||||||||||||

--Funcion cuando se clica se pone en pause y vuelve a la pantalla principal
function myfunction()
    pauseMus()
    composer.gotoScene( "pantalla1" )
    print(" >> pantalla 4 to pantalla 1")
end

--Pausa musica
function pauseMus()
        audio.pause( music )
end

--Sonar musica
function sonarMusica()
        local music = audio.loadSound( "sounds/GibbonMonkey.mp3")
        audio.play( music )
end

--FUNCTION CRONO
function listenerCronometre( event )
    temps = temps - 1
    numero.text = temps
    --print("Segons: "..temps)
    if(temps == 0) then
        composer.gotoScene( "pantalla1" )
        print(" >> pantalla 4 to pantalla 1 temps=0")
        pauseMus()
    end    

end-- FIN FUNCTION CRONO


--///////////////////////////////////////////////////////
-- "scene:show()"
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        print( ">> PANTALLA 4 - JOC 3!!"  )
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