-- space collector or sapce delivery not decided yet.....
-- as in the space, our resoucers are limited: 
--  Fuell, Oxygen, Water and food ar
-- but they can be recharged doring the game, by buing them in stations, or picket up out in the space (planest, asteroids,...)
-- if needed the we can use all our inventory as fuell (impulse, we can expell oxigen, whater and food to contnuig moving)
-- the fuell will decreas by uisng the acelerator, but also a tiny amount by time comusmed by the electricity inside the ship
--  to mantain the electricity. oxigen and food and water will be consumed by time too.
-- the game will be over if the tripulation is unable to move any more in the space and looses all the resources.
-- the game will end if theres no electricity to mantain the temperature. (the temperature will drop when no electricity is in the ship )
-- the game will end if the stamina of the crew is 0 (stamina is recover by water and food)
-- the game will loose if the oxigen hits 0 (we can turn the wather into oxigen but is expenive)
-- the game will will be finished correctly if you deliver the charge succesfully and your points will be the sum 
--  of all your resources and the paymet for the shipment.
--  it is an endless game and the goal is get the greatest score among the levels.
-- nice to have:
--      take damage on collision, this will impact ship performance there will be a specic amount of damage that the ship can take, if exided game over.
--      space parates (will try to lut your stuff by destroing you) siply Ai.
--      employ tripulation, the ship will be faster but the comsuption of the resorces will be incremented.

function love.load()
    -- initialization function 
    local cargo_sheep = require("source.game_objects.base_sprite")
end

function love.update(dt)
-- update will update based in the user input
-- dt is delta time and is a global variable that is updated by the love engine.
end

function love.draw()
--  draws the graphics in the screen. (it can update the graphics as this function is call during the game loop.)
end