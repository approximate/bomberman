extends Area2D

export var speed = 100
var screen_size

signal hit

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	#hide()
	show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2()
	
	if Input.is_action_pressed("ui_up"):
		$AnimatedSprite.animation = "up"
		velocity.y -= 1
	elif Input.is_action_pressed("ui_down"):
		$AnimatedSprite.animation = "down"
		velocity.y += 1
	elif Input.is_action_pressed("ui_left"):
		$AnimatedSprite.animation = "left"
		velocity.x -= 1
	elif Input.is_action_pressed("ui_right"):
		$AnimatedSprite.animation = "right"
		velocity.x += 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		
	position += velocity * delta

	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)


func _on_Player_body_entered(body):
	# hide()
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disabled", true)
	
	
	
