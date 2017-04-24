import sublime, sublime_plugin, os, subprocess, sys, inspect
from subprocess import Popen

class int_installer(sublime_plugin.WindowCommand):
	def run(self):
		sublime.status_message("Requesting user permission...")
		dialogResult = sublime.ok_cancel_dialog("Do you want to set the current instance of Poseidon Tools as default?\n\nPrototype, use at your own risk.", "I understand")
		if dialogResult==1:
			sublime.status_message("Updating registry path...")
			binDir = os.path.dirname(os.path.abspath(sublime.packages_path())) + "\Bin\Core\\"
			exeFile = binDir + "Installer.exe"
			print exeFile
			sublime.status_message("preparing installer... " + exeFile)
			try:
				proc = Popen(exeFile, shell=True, stdin=None, stdout=None, stderr=None, close_fds=True)
			except:
				dialogResult = sublime.error_message("Error: Failed to start the installer.")
				raise
			sublime.status_message("Updated registry path!")
		else:
			sublime.status_message("Update aborted")

class int_snippets(sublime_plugin.WindowCommand):
	def run(self):
		sublime.status_message("Requesting user permission...")
		dialogResult = sublime.ok_cancel_dialog("Do you want to run the Snippets manager?\n\nPrototype, use at your own risk.", "I understand")
		if dialogResult==1:
			binDir = os.path.dirname(os.path.abspath(sublime.packages_path())) + "\Bin\Core\\"
			exeFile = binDir + "Snippets.exe"
			print exeFile
			sublime.status_message("preparing... " + exeFile)
			try:
				proc = Popen(exeFile, shell=False, stdin=None, stdout=None, stderr=None, close_fds=True)
				sublime.status_message("Started " + exeFile)
			except:
				dialogResult = sublime.error_message("Error: Failed to start the Snippets manager.")
				raise



# class internal(sublime_plugin.WindowCommand):
# 	def run(self,type):
# 		if type=="installer":
# 			self.installer(self)
# 		elif type=="snippets":
# 			self.snippets(self)

# 	def snippets(self,type):
# 		sublime.status_message("Requesting user permission...")
# 		dialogResult = sublime.ok_cancel_dialog("Do you want to run the Snippets manager?\n\nPrototype, use at your own risk.", "I understand")
# 		if dialogResult==1:
# 			sublime.status_message("preparing... ")
# 			self.runFile("Snippets.exe")

# 	def installer(self,type):
# 		print self
# 		print type
# 		sublime.status_message("Requesting user permission...")
# 		dialogResult = sublime.ok_cancel_dialog("Do you want to set the current instance of Poseidon Tools as default?\n\nPrototype, use at your own risk.", "I understand")
# 		if dialogResult==1:
# 			sublime.status_message("Updating registry path...")
# 			sublime.status_message("preparing installer... ")
# 			self.runFile("Installer.exe")
# 			sublime.status_message("Updated registry path!")
# 		else:
# 			sublime.status_message("Update aborted")

# 	def runFile(exeFile,dummy):
# 		binDir = os.path.dirname(os.path.abspath(sublime.packages_path())) + "\Bin\Core\\"
# 		path = str(binDir)  + "" + str(exeFile)
# 		try:
# 			proc = Popen(path, shell=True, stdin=None, stdout=None, stderr=None, close_fds=True)
# 		except:
# 			dialogResult = sublime.error_message("Error: Failed to start " + str(exeFile))
# 			raise