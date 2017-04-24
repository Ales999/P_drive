import sublime
import sublime_plugin
import os
import subprocess

class arma3communitytools(sublime_plugin.WindowCommand):
	def run(self, type):
		directory=sublime.packages_path()
		if type=="settings":
			command = "cd "+directory+"\Bin & start settings.exe"
		else:
			if type=="updater":
				command= cmd = "cd "+directory+" & cd ..\..\Extra\communtyUpdater & start communtyUpdater.exe"
			else:
				command= cmd = "pushd "+directory+" & cd "+directory+" & cd Poseidon\extra & start Arma3CommunityTools.bat "+type
		print command
		os.system(command)