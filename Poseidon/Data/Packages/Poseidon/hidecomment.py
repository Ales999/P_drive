import sublime, sublime_plugin

class hidecomment(sublime_plugin.EventListener):
    def run(self, view):
        view.fold(view.find_by_selector('comment'))