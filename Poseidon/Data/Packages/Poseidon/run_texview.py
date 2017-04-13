import sublime
import sublime_plugin
import os
import subprocess

class run_texview(sublime_plugin.TextCommand):
	def run(self,edit):
		file_to_open=self.view.file_name()
		directory=sublime.packages_path()
		tester = file_to_open[-4:]
		if  (tester == '.paa' or tester == '.pac' or tester == '.jpg' or tester == '.tga' or tester == '.png'):
			file_final=str(' \"'+file_to_open+'\" ')
			cmd = "pushd "+directory+" & cd "+directory+" & cd Bin\TexView 2 & Start /I run"+file_final+"  & exit /b"
			os.system(cmd)
		else:
			cmd = "pushd "+directory+" & cd "+directory+" & cd Bin\TexView 2 & Start /I run & exit /b"
			os.system(cmd)