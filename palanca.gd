extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("desactivado")
	if Main.vida <= 0:
		Main.puerta = 1

func _on_palanca_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.is_in_group("jugador"):
		$AnimatedSprite.play("activado")
		Main.puerta += 1
	
