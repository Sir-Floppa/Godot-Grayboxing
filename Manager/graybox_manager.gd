@tool
class_name GrayboxManager extends Node2D
## A container for Block type nodes

## Defines if contained Blocks should have their
## textures hidden.
@export var disable_textures: bool = false
## Defines if contained Blocks have their
## collisions disabled
@export var disable_collisions: bool = false
## Defines if the Blocks are visible
## on the built game
@export var display_in_game: bool = false
var child_type_msg = "GrayboxManager should not contain non GrayboxBlock children."


func _ready() -> void:
	for child: GrayboxBlock in self.get_children():
		if not child.ignore_manager_config:
			child.disable_collision = disable_collisions
			child.disable_texture = disable_textures
			child.display_in_game = display_in_game


func _get_configuration_warnings() -> PackedStringArray:
	var warnings: Array[String] = []
	for child in self.get_children():
		if !child.has_method("is_block"):
			warnings.append(child_type_msg)
	return warnings
