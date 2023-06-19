# Space Collector
#### Video Demo:  <https://youtu.be/YjoCH4FO_II>
#### Description:
Simple game to Rescue the tribulation that has been ejected from a ship by mistake.
You are in the sace so the phisics you can use is just impulse but sadly this ship can
only impulsed by 4 moves up, down, left and right, it has a break function (space bar)
The impulse is cumulative so each time you add impulse the ship will go faster.
yo*u can escape the game with "ESC" and restart it by "r"

the game will end if you are not able to rescue all the tripulation.
Try your best and good luck.

### instal
this game is developed in Love2d game framework engine.
#### download link<https://love2d.org/>

Once it is installed you can run the game by executeing love in the folder of this project
and start main.lua.

### the structur of the game:
Main lua is the istart point of the game it will call the main "clases" that represeints the game:

#### Source
the source folder contais 3 folders:
* game_objects: this folder contains the clases to represent the objects displayed during the game:
  base_sprite_actor.lua, cargo_actor.lua, character_actor.lua character_controller.lua.

* game_setup:
  contains the file to configure the window dinmention and attributes.

* game_utilities contais helper functions to sapwn characters and the vercotr class.

### BaseSpriteActor
  For represinting the acotors in the game this is the base class that has
  the basic function to represent a grafic in the game.
  all spriete elemets inherits from this class to get the basic comun functions:
  * BaseSpriteActor:get_position():
    gets the current position of the sprite in the space
  * BaseSpriteActor:get_scale():
    gets the size in integers from ths sprite.
  * BaseSpriteActor:set_position(x, y):
    fucntion to be used by all subclasses to set the position, it is ment to
    be dynamic an changing during the game. this must be used in the update fucntion
    to set the position of the object.
  * BaseSpriteActor:set_scale(width,height):
    sets the with and height to the sprite, this will be used for calcualting the bounding
    space for colitions.
  * BaseSpriteActor:get_sprite_center():
    gets the center of the sprite this is usefull for set the image in the center of the position vector.
  * BaseSpriteActor:set_sprite_texture(image_path):
    create a sprite class out of the strig path provided. this funcion will be call in the init mothod of the
    character.
  * BaseSpriteActor:draw(shape_type):
    Base fucntion to draw the sprite, it could be overloaded in the subclasses to add estra behavior.
    To call this function we can use the "dot" notation to provide the subclass "self" velue to acces the original method.

### CharacterActor
  Actor to be possessed by the player, It inherits from the BaseSpriteActor, and adds new methods for update and calculate
  animation of the object.
  * CharacterActor:update(dt):
    udates all atributes form the class during the update phase of the game, it is a dynamic fucntion and will be computed
    by frame.

### CargoActor
  Representation of all interactive objects in the level.
  it has a "new()" method go create a complete new instance of the class as this class will generate multiple instances during
  the load method of love.

### CharacterController
  the character is moved by a controller this class is ment to be added as an agregation to the CharacterActor Class
  it has all the method for move the character.
  The design is thinked to be subtituted any time. so we can have other types of controller as long as it returns the impulse to
  be applied to the character.

### Spawner
  is the Level generator, it is based on random choised to intanciate several instance fo Cargo actors with diferent init values.
  as it is random each time the game is ran new positions and values will be created.
  It is used in the reload method of the game to recreate a new level.

### Vector_2d
  As love has not vector math this is a simple class to help calculate the dot proeuct, vector normalization  and simple
  vector operation.
  It can be extended to add more features to the mae.
