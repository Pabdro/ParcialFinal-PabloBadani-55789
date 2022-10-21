extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("cerrado")
	


func _on_cofre_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.is_in_group("jugador"):
		Main.contador += 10
		$AnimatedSprite.play("abierto")
		get_node("CollisionShape2D").queue_free()
