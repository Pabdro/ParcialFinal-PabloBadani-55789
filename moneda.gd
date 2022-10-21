extends Area2D


func _ready():
	$AnimationPlayer.play("moneda")


func _on_moneda_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.is_in_group("jugador"):
		$CollisionShape2D.disabled = true
		$monedasonido.play()
		Main.contador += 1
		$AnimationPlayer.play("moneda2")


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
