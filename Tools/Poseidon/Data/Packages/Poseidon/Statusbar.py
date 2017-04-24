import sublime
import sublime_plugin
class CurrentPathStatusCommand(sublime_plugin.EventListener):
	def on_activated(self, view):
		filename = view.file_name()
		if filename:
			fileEncoding=''+view.encoding()+''
			view.set_status('zPath',  '0.994.199; '+fileEncoding+'; ')
		else:
			view.set_status('zPath',  '0.994.199; ')