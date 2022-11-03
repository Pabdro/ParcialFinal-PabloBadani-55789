extends KinematicBody2D

var vida = 2
var velocidad = 50
var movimiento = Vector2(0,0)
var forgod = false
var gravedad = 100
var ataque = false
var poder = preload("res://enemigo.tscn")
var final = preload("res://nube.tscn")
var invocacion = false

func _process(delta):
	golpear()

func _physics_process(_delta) -> void:
	if vida <= 0:
		$AnimationPlayer.play("dead")
	elif vida > 0:
		if $izq.is_colliding() && invocacion == false && forgod == false:
			$AnimationPlayer.play("ataque")
		else:
			if ataque == false && forgod == false:
				$AnimationPlayer.play("idle")
	
	movimiento.y += gravedad
	movimiento = move_and_slide(movimiento, Vector2.UP)
	movimiento.x = lerp(movimiento.x, 0, 0.2)
	
func golpear():
	if $izq2.is_colliding():
		Main.vida -= 3
	if $der2.is_colliding():
		Main.vida -= 3
		
func _on_Area2D_area_entered(area):
	if area.is_in_group("hit"):
		vida -= 1



func _on_AnimationPlayer_animation_finished(ataq):
	if ataq == "ataque":
		ataque == false
	if ataq == "invocacion":
		forgod = false
		var area = $enemigo
		var enemy = poder.instance()
		get_parent().add_child(enemy)
		enemy.position = Vector2(area.global_position.x, area.global_position.y)
	if ataq == "dead":
		queue_free()

func _on_AnimationPlayer_animation_started(ataq):
	if ataq == "ataque":
		ataque = true
	if ataq == "invocacion":
		forgod = true
		var area = $nube
		var nube = final.instance()
		get_parent().add_child(nube)
		nube.position = Vector2(area.global_position.x, area.global_position.y)

func _on_Timer_timeout():
	$AnimationPlayer.play("invocacion")
