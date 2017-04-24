import webbrowser
import sublime, sublime_plugin

class searchDoc_command(sublime_plugin.TextCommand):

   def run(self, edit, url):
        for region in self.view.sel():
            if region.begin() == region.end():
                word = self.view.word(region)
            else:
                word = region
            if not word.empty():
            	keyword = ""
                keyword = self.view.substr(word)
                webbrowser.open(url % keyword)