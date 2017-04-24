import sublime
import sublime_plugin
import os
import subprocess
from _winreg import *

class run_fsm(sublime_plugin.TextCommand):
	def run(self,file):
		file_to_open =self.view.file_name()
		tester = file_to_open[-4:]
		directory=sublime.packages_path()
		print directory
		if (tester == '.fsm' or tester == '.FSM' or tester == 'ifsm'):
			file_final=str(' \"'+file_to_open+'\" ')
			cmd = "cd "+directory+" & cd Bin\FsmEditor  & Start /I run "+file_final
			print cmd
			os.system(cmd)
		else:
			cmd = "pushd "+directory+" & cd "+directory+" & cd Bin\FsmEditor  & Start /I run & popd"
			print cmd
			os.system(cmd)