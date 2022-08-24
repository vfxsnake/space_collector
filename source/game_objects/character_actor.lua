require("source/game_objects/base_sprite_actor")

CharacterActor = {}
CharacterActor.__index = CharacterActor
setmetatable(CharacterActor, BaseSpriteActor)
