extends Node

### Global Flags ###
# Flags for verious levels meant to make it easier to create per-level effects
# and per-level controls. You can reference this table using Flag.[Flag Category].[key]
# eg: 
## if Flag.s.HasFinishedLevel1: causePanic()
# The dictionary s >> Flag.s are only boolean checks
# The dictionary loc >> Flag.loc contain int locators
# 
# Contact me if you need more flag types, such as floats etc.

@export var Loc:Dictionary[String, String] = {
	"CurLevel": "Main" # String Literal, Location
	
	
}

## Flags used in per-level effects
@export var s:Dictionary[String, bool] = {
	# Clear Level flags
	"HasFinishedLevel0": false, #Tutorial
	"HasFinishedLevel1": false, #Winds
	"HasFinishedLevel2": false, #Plates
	"HasFinishedLevel3": false, #Door
	
	
	
	
	
	
	
	
	
	
}
