FileDiffs Plugin
================

Shows diffs between the current file, or selection(s) in the current file, and clipboard, another file, or unsaved changes. Can be configured to show diffs in an external diff tool

Commands
--------

`file_diff_menu`: Shows a menu to select one of the file_diff commands.  If you use the bindings in Example.sublime-keymap, this is bound to `ctrl+shift+d`.

The rest of the commands do not need to be bound (accessible from the menu):

`file_diff_clipboard`: Shows the diff of the current file or selection(s) and the clipboard (the clipboard is considered the "new" file unless `reverse` is True)

`file_diff_selections`: Shows the diff of the first and second selected regions.  The file_diff_menu command checks for exactly two regions selected, otherwise it doesn't display this command.

`file_diff_saved`: Shows the diff of the current file or selection(s) and the saved file.

`file_diff_file`: Shows the diff of the current file or selection(s) and a file that is in the current project.

`file_diff_tab`: Shows the diff of the current file or selection(s) and an open file (aka a file that has a tab).
