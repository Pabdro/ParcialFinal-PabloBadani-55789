extends Node2D

func _ready():
	$AnimationPlayer.play("nube")

func _on_AnimationPlayer_animation_finished(nube):
	if nube == "nube":
		queue_free()
