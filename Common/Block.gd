class_name GrayboxBlock extends StaticBody2D
## A grayboxing block for map/scene prototyping.
##
## Controls the visibility and/or interactivity of the block.
## It should be only managed through the GrayboxManager node
## unless ignore_manager_config is set to true.

@export_group("Configuration")
## Define if the block should ignore its GrayboxManager parent
## config. It should be set to true if the block is being used
## in a standalone manner.
@export var ignore_manager_config: bool = false
@export_subgroup("Visibility")
## Defines if the texture node should be hidden.
@export var disable_texture: bool = false
## Defines if the collision node should be disabled.
@export var disable_collision: bool = false
## Defines if the block will be shown in the built game.
@export var display_in_game: bool = false

@onready var texture: Sprite2D = $Texture
@onready var collision := $Collision


func _ready() -> void:
	if not ignore_manager_config:
		var parent = get_parent()
		disable_collision = parent.disable_collisions
		disable_texture = parent.disable_textures
		display_in_game = parent.display_in_game
	
	collision.disabled = disable_collision
	if disable_texture:
		texture.hide()
	if not Engine.is_editor_hint():
		if display_in_game and not disable_texture:
			texture.show()
		

func is_block():
	return true
