import sublime
import sublime_plugin
import os
import subprocess
 
class run_tail(sublime_plugin.WindowCommand):
	def run(self):
		directory=sublime.packages_path()
		# directory = os.path.dirname(os.path.realpath(__file__))
		# sublime.message_dialog(""+directory+"")
		cmd = "cd "+directory+" & cd Bin\Tail & Start /I run"
		os.system(cmd)