local composer = require( "composer" )
local physics = require("physics")
physics:start()
local scene = composer.newScene()
local temps = 20
local numero
local puntuacio = 0
local textpuntuacio


local function touchBall( event )
    print( " >> function touch banana" )
     if event.phase == "began" then
        event.target:setFillColor( math.random(0,1), math.random(0,1),math.random(0,1) )
    end

    return true
end

 local function touchBanana( event )
         if event.phase == "began" then
            puntuacio = puntuacio+1
            textpuntuacio.text = puntuacio -- puntos al click banana
            print( " >>puntuacio"..puntuacio )
            sonidoPlatano()
            event.target:removeSelf( )
        end

        return true
    end

    local function listener( event )

        --local cercle = display.newCircle( math.random( 0, _W ), 0, 20 )
        --cercle:setFillColor( math.random(0,0.8), math.random(0,0.8),math.random(0,0.8))
        --physics.addBody( cercle, { density = 0.1, bounce = 1 } )
        local params = { time = 5000, y = _H-50}
        --transition.to( cercle, params )
        --cercle:addEventListener( "touch", touchBall )
        --cercle:setFillColor(0,0,0)
       
        local image = display.newImageRect( "img/platanoAbierto.png", 130,150)
        physics.addBody( image, { density = 0.1, bounce = 1} )
        transition.to( image, params )
      --  image.anchorX = 0
      --  image.anchorY = 0.5
        image.x = math.random( 0+65, _W-65 )
        image.y = 0
        image:addEventListener( "touch" , touchBanana )
        


    end


-- "scene:create()"
function scene:create( event )

    local sceneGroup = self.view
    local background = display.newImageRect( sceneGroup, "img/fondoJoc1.png", _W,_H)
    background.x = _centerX
    background.y = _centerY
    background:setFillColor( 255/255, 255/255, 255/255 )

    -- timer.performWithDelay( 1000, listener, 0 )

    --cronometre
    print (" >> establecemos el tiempo: ")
    print  (temps)
    -- timer.performWithDelay( 1000, listenerCronometre, temps )
    numero = display.newText(sceneGroup, "", 340, 230, native.systemFont, 65 )
    numero.text = temps
    numero:setFillColor( 255,0,0 )

    --puntuacio
    textpuntuacio = display.newText( sceneGroup, "", 330, 130, native.systemFont, 65 )
    textpuntuacio:setFillColor( 255,0,0 )

end
---------------------------------------------------

--||||||||||||||||||||FUNCIONES|||||||||||||||||||||||

--Funcion cuando se clica se pone en pause y vuelve a la pantalla principal
function myfunction()
    --Al clickar el boton back
    print(" >> pantalla 2 to pantalla 1")
    pauseMus()
    
    composer.gotoScene( "pantalla1" )
    
end

--Pausa musica
function pauseMus()
    
    audio.pause( music )
   
end

--Sonar musica
function sonarMusica()
        local music = audio.loadSound( "sounds/Click.mp3")
        audio.play( music )
end

function sonidoPlatano()
    local music = audio.loadSound( "sounds/explosionglobo.mp3")
        audio.play( music )
end


--FUNCTION CRONO
function listenerCronometre( event )
    temps = temps - 1
    numero.text = temps
    print("Segons: "..temps)
    if(temps == 0) then

        print(" >> pantalla 2 to pantalla 1 temps=0")
        pauseMus()
        temps = 20
        composer.gotoScene( "pantalla1" )
        
    end    

end-- FIN FUNCTION CRONO


--------------------------------------------------
-- "scene:show()"
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase
   
   
    if ( phase == "will" ) then
        print( ">> inicio PANTALLA 2 - JOC 1!!" )
        -- numero.text = temps

    elseif ( phase == "did" ) then
        numero.text = temps
        -- sonarMusica()--llama a la funcion 
        -- print( ">> musica start" )
        timer.performWithDelay( 1000, listener, 0 )--caen platanos

        temps=20
        print( " >> show--> temps "..temps )
        timer.performWithDelay( 1000, listenerCronometre, temps )



        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
    end
    print( " >>Fin scene" )
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