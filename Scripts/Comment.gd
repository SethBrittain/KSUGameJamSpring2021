extends Control

func update_text(username, comment): #fills the comment text boxes with random text
	get_node("Comment/CommentBody/Text/UsernameNode").text = username
	get_node("Comment/CommentBody/Text/CommentBody").text = comment
