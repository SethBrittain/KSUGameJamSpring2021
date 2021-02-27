extends ScrollContainer

var comment_file_path = "res://comments.txt"
var username_file_path = "res://usernames.txt"

onready var comment_scene = preload("res://Scenes/Comment.tscn")

var comment_file
var username_file

func _ready(): #Opens comment and username txt files
	comment_file = File.new()
	username_file = File.new()
	comment_file.open(comment_file_path, comment_file.READ)
	username_file.open(username_file_path, username_file.READ)

func get_random_line(file):
	var line_counter = 0 #num of lines
	while !file.eof_reached(): # iterate through all lines until the end of file is reached
		line_counter+=1
		file.get_line() #advances cursor by one line
	
	file.seek(0) #reset cursor to line 0
	var random_last_line = randi() % line_counter 
	
	for i in range(0,random_last_line-1): #advaces cursor to random line -1
		file.get_line()
	return file.get_line() #returns random line

func generate_comment(): #creates new comment instance with rand username and comment text
	var b = comment_scene.instance()
	randomize()
	b.update_text(get_random_line(username_file), get_random_line(comment_file))
	self.get_child(0).add_child(b)
