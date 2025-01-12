@tool
class_name GrayboxManager extends Node2D
## A container for Block type nodes

## Defines if contained Blocks should have their
## textures hidden.
@export var disable_textures: bool = true
## Defines if contained Blocks have their
## collisions disabled
@export var disable_collisions: bool = true
## Defines if the Blocks are visible
## on the built game
@export var display_in_game: bool = true
var child_type_msg = "GrayboxManager should not contain non GrayboxBlock children."


func _get_configuration_warnings() -> PackedStringArray:
	var warnings: Array[String] = []
	for child in self.get_children():
		if !child.has_method("is_block"):
			warnings.append(child_type_msg)
	return warnings
