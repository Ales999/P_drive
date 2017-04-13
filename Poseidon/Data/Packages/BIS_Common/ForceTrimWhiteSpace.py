import sublime
import sublime_plugin

class TrimWhiteSpace(sublime_plugin.WindowCommand):
    def run(self,edit):
        trailing_white_space = view.find_all("[\t ]+$")
        sublime.message_dialog(""+trailing_white_space+"")
        trailing_white_space.reverse()
        #edit = view.begin_edit()
        #for r in trailing_white_space:
        #    view.erase(edit, r)
        #view.end_edit(edit)