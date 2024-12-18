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


# for debugging
func _on_button_pressed() -> void:
	if !sound_playing:
		resume()
		sound_playing = true
	else:
		sound_playing = false
		pause()
