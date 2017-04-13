import sublime
import sublime_plugin
import os
import subprocess
import run_texview

# Python definitly needs a switch statement!!!!!!! FFS!!!!!!!

class run_external(sublime_plugin.TextCommand):
	def run(self,edit):
		file_to_open=self.view.file_name()
		directory=sublime.packages_path()

		file_final=' "'+str(self.view.file_name())+'"'
		#sublime.message_dialog(""+filename+"")
		#sublime.message_dialog(file_final)

		tester = file_to_open[-4:]
		tester = tester.lower()
		print tester

		if (tester == '.paa' or tester == '.pac' or tester == '.jpg' or tester == '.tga' or tester == '.png'):
			# run texview
			cmd = "pushd "+directory+" & cd "+directory+" & cd Bin\TexView 2  & Start /I run"+file_final
			os.system(cmd)
		else:

			if (tester == '.fsm' or tester == '.FSM' or tester == 'ifsm'):
				# run FSM editor
				cmd = "pushd "+directory+" & cd "+directory+" & cd Bin\FsmEditor  & Start /I run "+file_final
				os.system(cmd)
			else:

				if (tester=='.rpt' or tester=='.log'):
					# run Tail
					cmd = "pushd "+directory+" & cd "+directory+" & cd Bin\Tail  & Start /I run"+file_final
					os.system(cmd)
				else:

					if (tester=='.rpt' or tester=='.log'):
						#  run Oxygen
						cmd = "pushd "+directory+" & cd "+directory+" & cd Bin\O & start /i run"
						os.system(cmd)
					else:

						if (tester=='.pew' or tester=='.pbl' or tester=='.xyz'):
							#run visitor
							cmd = "pushd "+directory+" & cd "+directory+" & cd Bin\visitor & start /i run"
							os.system(cmd)
						else:
							if (tester=='.sqm'):
								version=self.view.find('version=12',0)
								#run A3
								if (self.view.find('version=12',0) or (self.view.find('version = 12',0))):
									directory=sublime.packages_path()
									cmd = "pushd "+directory+" & cd "+directory+" & cd Bin\A3 & start run "+file_to_open+""
									os.system(cmd)
								else:
										directory=sublime.packages_path()
										cmd = "pushd "+directory+" & cd "+directory+" & cd Bin\A2 & start && run "+file_to_open+""
										os.system(cmd)
							else:
								if (tester=='iedi'):
									directory=sublime.packages_path()
									cmd = "pushd "+directory+" & cd "+directory+" & cd Bin\A3 & start run "+file_to_open+""
									os.system(cmd)
								else:
									# run notepad
									cmd="color 8f & title CMD FROM POSEIDON && echo You can safely close this cmd && call "+file_final+" & exit"
									# run program FTW :D
									os.system(cmd)
		print cmd