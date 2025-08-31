extends Area2D



func _on_body_entered(body):
	if Input.is_action_pressed("attack"):
		body.get_node("Enemy").queue_free()
