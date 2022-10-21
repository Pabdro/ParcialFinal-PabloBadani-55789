extends KinematicBody2D

var velocidad = 60
var movimiento = Vector2(0,0)
var salto = -500
var gravedad = 20
var ataque = false
var muerta = false

func _process(delta) -> void:
	pass

func _physics_process(delta):
	if Main.vida <= 0:
		$AnimatedSprite.play("muerta")
	elif Main.vida > 0:
		if Input.is_action_pressed("hit"):
			$AnimatedSprite.play("ataque")
			ataque = true
		elif Input.is_action_pressed("derecha") && ataque == false:
			movimiento.x += velocidad
			$AnimatedSprite.play("run")
			$AnimatedSprite.flip_h = false
		elif Input.is_action_pressed("izquierda") && ataque == false:
			movimiento.x -= velocidad
			$AnimatedSprite.play("run")
			$AnimatedSprite.flip_h = true
		else:
			if ataque == false:
				$AnimatedSprite.play("idle")
				$Area2D/CollisionShape2D.disabled = true
		if not is_on_floor() && ataque == false && muerta == false:
			$AnimatedSprite.play("jump")
		if Input.is_action_just_pressed("arriba") and is_on_floor() && ataque == false && muerta == false:
			movimiento.y = salto
			$salto.play()
		
	movimiento.y += gravedad
	movimiento = move_and_slide(movimiento, Vector2.UP)
	movimiento.x = lerp(movimiento.x, 0, 0.2)
		
func motion_ctr():
	if Input.is_action_just_pressed(""):
		$AnimatedSprite.play("")
		pass
		
	movimiento.y += gravedad
	movimiento = move_and_slide(movimiento, Vector2.UP)
	movimiento.x = lerp(movimiento.x, 0, 0.2)


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "ataque":
		$Area2D/CollisionShape2D.disabled
		$AnimatedSprite.play("idle")
		$espada.play()
		ataque = false
	if $AnimatedSprite.animation == "muerta":
		queue_free()


func _on_AnimatedSprite_frame_changed():
	if $AnimatedSprite.animation == "muerta":
		muerta = true
	if $AnimatedSprite.animation == "ataque":
		$Area2D/CollisionShape2D.disabled = false
	else:
		$Area2D/CollisionShape2D.disabled = true
