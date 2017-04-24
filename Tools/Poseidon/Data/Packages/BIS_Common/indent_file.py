import sublime
import sublime_plugin
import os
import subprocess
 
class indent_file(sublime_plugin.TextCommand):
	def run(self,edit):
		file_to_open =self.view.file_name()
		directory=sublime.packages_path()
		print directory
		fullPath=os.path.splitdrive(directory)
		driveLetter=str(fullPath[0:1])
		driveLetter = driveLetter.replace("(u'", "")
		driveLetter = driveLetter.replace("',)", "")
		cmdPath="".join([str(driveLetter), " & cd ",str(directory), '& cd ..\..\ & tm4_indenter.exe -silent "', str(file_to_open), '"'])
		print cmdPath
		os.system(str(cmdPath))