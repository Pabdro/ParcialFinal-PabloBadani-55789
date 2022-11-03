extends KinematicBody2D
var vida = 1
var velocidad = 70
var movimiento = Vector2(0,0)
var forgod = true
var gravedad = 20

func _process(delta):
	golpear()

func _physics_process(delta) -> void:
	if vida <= 0:
		$AnimationPlayer.play("muerto")
	elif vida > 0:
		if $izq.is_colliding():
			$Sprite.flip_h = true
			$AnimationPlayer.play("atacarIzq")
			movimiento.x == 0
		elif $der.is_colliding():
			$Sprite.flip_h = false
			$AnimationPlayer.play("atacar")
			movimiento.x == 0
		else:
			if is_on_wall():
				forgod = not forgod
			if forgod == true:
				movimiento.x = velocidad
				$AnimationPlayer.play("caminar")
				$Sprite.flip_h = false
			else:
				movimiento.x = -velocidad
				$AnimationPlayer.play("caminar")
				$Sprite.flip_h = true
		
	movimiento.y += gravedad
	movimiento = move_and_slide(movimiento, Vector2.UP)
	movimiento.x = lerp(movimiento.x, 0, 0.2)

func golpear():
	if $izq2.is_colliding():
		Main.vida -= 0.5
	if $der2.is_colliding():
		Main.vida -= 0.5



func _on_Area2D_area_entered(area):
	if area.is_in_group("hit"):
		vida -= 1


func _on_AnimationPlayer_animation_finished(muerto):
	if muerto == "muerto":
		queue_free()
