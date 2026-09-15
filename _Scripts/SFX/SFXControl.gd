extends Node

## Audio Master Volume
@export_range(0, 100, 1, "prefer_slider") var volume:int = 80

## Audio Direction
@export_range(-100, 100, 1.0, "prefer_slider") var direction:float = 0 # -100 is full Left, 100 is full right

## Individual Audio Stream Volume for creating multitrack dynamical soundscapes!
var StreamVolume:Vector4i = Vector4i(100, 0, 0, 0)
