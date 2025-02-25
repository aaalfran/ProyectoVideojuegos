extends Area2D

var insideLight1BreakerArea = false
var Light1isShut = false
signal shutLight1
func _ready():
	set_process_input(true)

func _on_body_entered(body):
	if body.is_in_group("Player"):
		insideLight1BreakerArea = true


func _on_body_exited(body):
	if body.is_in_group("Player"):
		insideLight1BreakerArea = false
		
func _input(event):
		if insideLight1BreakerArea and event.is_action_pressed("interact") and !Light1isShut:
			print("Apagaste la Torre negra1")
			emit_signal("shutLight1")
			Light1isShut = true
			
			var sound_player = AudioStreamPlayer.new()
			add_child(sound_player)
			var sound = preload("res://Sound/sabotage.wav") 
			sound_player.stream = sound
			sound_player.play()
			await get_tree().create_timer(0.4).timeout 
