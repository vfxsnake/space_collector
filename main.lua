-- space rescuer or sapce delivery not decided yet.....
-- as in the space, our resoucers are limited: 
--  Fuell, Oxygen, Water and food,
-- but they can be recharged doring the game, pick them up out in the space (planest, asteroids,...)
-- if needed the we can use all our inventory as fuell (impulse, we can expell oxigen, whater and food to contnuig moving)
-- the fuell will decreas by uisng the acelerator, but also a tiny amount by time comusmed by the electricity inside the ship
--  to mantain the electricity. oxigen and food and water will be consumed by time too.
-- the game will be over if the ship is unable to move anymore and consume all the resources.
-- the game will end if theres no electricity to mantain the temperature. (the temperature will drop when no electricity is in the ship )
-- the game will end if the stamina of the crew is 0 (stamina is recover by water and food)
-- the game will loose if the oxigen hits 0 (we can turn the wather into oxigen but is expenive)
-- the game will will be finished correctly if you deliver the charge succesfully and your points will be the sum 
--  of all your resources and the paymet for the shipment.
--  it is an endless game and the goal is get the greatest score among the levels.
-- nice to have:
--      take damage on collision, this will impact ship performance there will be a specic amount of damage that the ship can take, if exided game over.
--      space parates (will try to lut your stuff by destroing you) siply Ai.


-- imports
require("source/game_objects/character_actor")
require("source/game_objects/cargo_actor")
require("source/game_setup/window_setup")
require("source/game_utilities/spawner")

-- debugging setups
if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
    require("lldebugger").start()
  end

StartTime = 0
ElapsedTime = 0

function love.load()
    -- initialization function 
    -- setup main window
    MainWindow = Window
    MainWindow:setup()
    -- init player
    Player = CharacterActor:new()
    Player:set_position(100, 100)
    -- init level spawner
    Level = Spawner:new()
    Level.number_of_instances = 5
    Level.actor_array = {}
    Level:spawn_actors(CargoActor, 100, MainWindow.width - 200, 200, MainWindow.height - 200)
    StartTime = love.timer.getTime()
end

function love.update(dt)
-- update will update based in the user input
-- dt is delta time and is a global variable that is updated by the love engine. 
    ExitGame()
    GameRestart()
    Player:update(dt)
    Level:update(dt, Player:get_bounding_data())
end

function love.draw()
--  draws the graphics in the screen. (it can update the graphics as this function is call during the game loop.)
    if Level.game_over then
        
        love.graphics.print("A tripulation member is out of reach...", 400, 400)
        return
    end
    if Win() then
        if ElapsedTime ==0 then
            ElapsedTime = love.timer.getTime() - StartTime
        end
        
        love.graphics.print("you resque all the tripulation Thanks!!!", 200,200,0, 1,1)
        love.graphics.print( "Time: " .. ElapsedTime, 400, 400, 0, 1,1)
        return
    end
    Player:draw('circle')
    Level:draw()
end

function ExitGame()
    if love.keyboard.isDown("escape") then
        love.event.quit()
    end
end

function GameRestart()
    if love.keyboard.isDown("r") then
        
        love.load()
    end
end

function Win()
    if #Level.actor_array == 0 then
        return true
    end
    return false
end