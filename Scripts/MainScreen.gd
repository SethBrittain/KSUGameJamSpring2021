extends Control

func _on_GenComment_button_up():
	get_node("ColorRect/CommentChain").generate_comment() #generate new comment in chain
