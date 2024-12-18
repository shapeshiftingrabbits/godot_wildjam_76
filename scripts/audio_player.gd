extends AudioStreamPlayer


var current_play_position: float = 0.0
var sound_playing = false
var first_time = true

func pause():
	stream_paused = true


func resume():
	if first_time:
		play(current_play_position)
		first_time = false
	else:
		stream_paused = false


func _on_ended_state_state_entered() -> void:
	stop()

# for debugging
func _on_button_pressed() -> void:
	if !sound_playing:
		resume()
		sound_playing = true
	else:
		sound_playing = false
		pause()


func _on_reset() -> void:
	first_time = true
