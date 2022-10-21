extends Area2D

func _process(delta):
	if Main.puerta == 1:
		$AnimatedSprite.play("cerrado")
		$CollisionShape2D.disabled = true
	elif Main.puerta >= 2:
		$AnimatedSprite.play("abierto")
		$CollisionShape2D.disabled = false

func _on_puerta_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.is_in_group("jugador"):
		get_tree().change_scene("res://Main2.tscn")
