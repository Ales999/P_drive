import sublime
import sublime_plugin
import tempfile
import re
import os
import shutil
import time
try:
	import init
	from init import *
except ImportError:
	print("INIT MODULE NOT LOADED")

class hotbackup(sublime_plugin.TextCommand):
	def run(self, edit):
		PTbaseDir = os.path.expanduser('~\Documents\Poseidon Tools\\')
		PTExportDir = PTbaseDir + 'Exports\\'
		if os.path.exists(self.view.file_name()):
			source = self.view.file_name()
			fineName = str(time.time()) + "_" + os.path.basename(self.view.file_name())
			shutil.copy(source, PTExportDir + fineName)
			# logger(PTExportDir + fineName)