extends Node

### Global SFX ###
# Variables that store how the game handles SFX effects and variables
# such as Volume, Audio directionality, multichannel FX and more.
#
# Contact me if you need finer control types, such as a logarithmic Volume output etc.

## Audio Master Volume
@export_range(0, 100, 1, "prefer_slider") var volume:int = 80

## Audio Direction
@export_range(-100, 100, 1.0, "prefer_slider") var direction:float = 0 # -100 is full Left, 100 is full right

## Individual Audio Stream Volume for creating multitrack dynamical soundscapes!
var StreamVolume:Vector4i = Vector4i(100, 0, 0, 0)

## Interrupt All Audio
func KillSystemAudio() -> void:
	match OS.get_name():
		"Windows":
			OS.execute("powershell", ["-Command", "(New-Object -ComObject WScript.Shell).SendKeys([char]173)"])
		"Mac":
			OS.execute("osascript", ["-e", "set volume output volume 0"])
		"Linux", "OpenBSD", "BSD":
			OS.execute("pactl", ["set-sink-volume", "@DEFAULT_SINK@", "0%"])
		_:
			push_warning("Bro what kind of wacky OS is this! Failed to mute OS Audio!")
