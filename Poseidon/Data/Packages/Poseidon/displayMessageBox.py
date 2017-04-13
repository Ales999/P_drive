import sublime, sublime_plugin, subprocess, os, ctypes, os
try:
	import init
	from init import *
except ImportError:
	print("INIT MODULE NOT LOADED")

class displayMessageBox(sublime_plugin.TextCommand):
	def run(self):
		style = 0
		ctypes.windll.user32.MessageBoxA(0, "text", "title", 0)