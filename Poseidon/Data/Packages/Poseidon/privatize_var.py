import sublime
import sublime_plugin
import urllib
import urllib2
import threading
import re

class privatize_var(sublime_plugin.TextCommand):
	def run(self, edit):
		for region in self.view.sel():
			if region.begin() == region.end():
				word = self.view.word(region)
			else:
				word = region
			if not word.empty():
				keyword = ""
				keyword = self.view.substr(word)

				listVar = []
				pattern = r'\b(_[a-zA-Z_0-9.]*)'

				for m in re.finditer(pattern, keyword):
					try:
						if not m.group(0) in listVar:
							listVar.append(m.group(0))
							print m.group(0)
							
					except TypeError:
						pass

				privateVars = ""
				for item in listVar:
						privateVars = privateVars + '"' + item + '",'
				privateVars = privateVars.replace(' ', "")
				privateVars = privateVars.replace(',', ", ")
				privateVars = privateVars.replace('"_x",', "")
				privateVars = privateVars.replace('"_alt",', "")
				privateVars = privateVars.replace('"_destination",', "")
				privateVars = privateVars.replace('"_exception",', "")
				privateVars = privateVars.replace('"_forEachIndex",', "")
				privateVars = privateVars.replace('"_from",', "")
				privateVars = privateVars.replace('"_group",', "")
				privateVars = privateVars.replace('"_id",', "")
				privateVars = privateVars.replace('"_i",', "")
				privateVars = privateVars.replace('"_isHighCommand",', "")
				privateVars = privateVars.replace('"_isSelected",', "")
				privateVars = privateVars.replace('"_leader",', "")
				privateVars = privateVars.replace('"_name",', "")
				privateVars = privateVars.replace('"_new",', "")
				privateVars = privateVars.replace('"_sentenceId",', "")
				privateVars = privateVars.replace('"_shift",', "")
				privateVars = privateVars.replace('"_target",', "")
				privateVars = privateVars.replace('"_target",', "")
				privateVars = privateVars.replace('"_to",', "")
				privateVars = privateVars.replace('"_topic",', "")
				privateVars = privateVars.replace('"_uid",', "")
				privateVars = privateVars.replace('"_units",', "")
				privateVars = privateVars.replace('"_this",', "")
				privateVars = privateVars.replace('"_fnc_",', "")
				privateVars = privateVars.replace('"_",', "")
				privateVars = privateVars.replace('"__filename",', "")
				privateVars = privateVars.replace(' ', "")
				privateVars = "private [" + privateVars + "];"
				privateVars = privateVars.replace(',];', "];")
				print privateVars
				self.view.insert(edit, region.begin(), privateVars + "\n")
