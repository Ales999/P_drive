import os
import sys
import subprocess
import sublime
import sublime_plugin

class open_log(sublime_plugin.WindowCommand):
	def run(self,type):
		directory=sublime.packages_path()
		if type=="a3":
			command=  "pushd "+directory+" & cd "+directory+" & cd Poseidon\extra & start _openLog_rpt_a3.bat /c & popd"
			os.system(command)
		elif type == "a2":
			command=  "pushd "+directory+" & cd "+directory+" & cd Poseidon\extra & start _openLog_rpt_a2.bat /c & popd"
			os.system(command)
		elif type == "a2oa":
			command=  "pushd "+directory+" & cd "+directory+" & cd Poseidon\extra & start _openLog_rpt_a2oa.bat /c & popd"
			os.system(command)
		elif type == "bulldozer":
			command=  "pushd "+directory+" & cd "+directory+" & cd Poseidon\extra & start _openLog_rpt_bulldozer.bat /c & popd"
			os.system(command)
		elif type == "server":
			command=  "pushd "+directory+" & cd "+directory+" & cd Poseidon\extra & start _openLog_rpt_a3server.bat /c & popd"
			os.system(command)
		elif type == "diaga3":
			command=  "pushd "+directory+" & cd "+directory+" & cd Poseidon\extra & start _openLog_rpt_a3diag.bat /c & popd"
			os.system(command)
		elif type == "a3dir":
			command=  "pushd "+directory+" & cd "+directory+" & explorer ""%userprofile%\AppData\Local\Arma 3"" & popd"
			os.system(command)
