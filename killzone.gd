extends Area2D


@onready var timer = $Timer

func _on_body_entered(body):
	if Input.is_action_pressed("attack"):
		print("Worked")

	elif not Input.is_action_pressed("attack"):
		print("You died!")
		Engine.time_scale = 0.5
		body.get_node("CollisionShape2D").queue_free()

		timer.start()



func _on_timer_timeout():
	Engine.time_scale = 1
	get_tree().reload_current_scene()
