extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	pass

func _on_Player_hit():
	$Player/AudioStreamPlayer.play()
