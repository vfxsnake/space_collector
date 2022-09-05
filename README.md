# Space Collector
#### Video Demo:  <URL https://youtu.be/YjoCH4FO_II>
#### Description:
Simple game to Rescue the tribulation that has been ejected from a ship by mistake.
You are in the sace so the fisic you can use is just impulse but sadly this ship can
only impulsed by 4 moves up, down, left and right, it has a break function (space bar)
The impulse is cumulative so each time you add impulse the ship will go faster.
yo*u can escape the game with "ESC" and restart it by "r"
 
the game will end if you are not able to rescue all the tripulation.
Try your best and good luck.
 
Is a Love2d-lua game separated in multiple files to contain all the "class like objects"
it uses inheritance from the base_sprite_actor to represent all movable characters
* the Character_actor is the possessable character that the player can use
* The Cargo_actor is the collectable objects that the shape can take.
    The level is defined by the spawner.
* The spawner is the level editor. is a random base spawner that changes each time the
  the game is initialized.
* vector_2d is a small vector library to help manipulate the objects in the game.
 
the project has been created to be extended after.
