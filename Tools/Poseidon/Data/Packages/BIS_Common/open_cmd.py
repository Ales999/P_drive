import sublime, sublime_plugin, subprocess, os
import ctypes
from ctypes import wintypes
_GetShortPathNameW = ctypes.windll.kernel32.GetShortPathNameW
_GetShortPathNameW.argtypes = [wintypes.LPCWSTR, wintypes.LPWSTR, wintypes.DWORD]
_GetShortPathNameW.restype = wintypes.DWORD

class open_cmd(sublime_plugin.TextCommand):
	def run(self, edit):
		directory = os.path.dirname(self.view.file_name())
		fullPath=os.path.splitdrive(directory)
		driveLetter=str(fullPath[0:1])
		driveLetter = driveLetter.replace("(u'", "")
		driveLetter = driveLetter.replace("',)", "")
		#print os.path.abspath(u''+os.path.splitdrive(directory)+'')
		#directory = os.path.normcase(directory)
		baseName = os.path.basename(directory)
		directorySym = directory
		directory = getShortPath(directory)
		cmd=''.join(['SETLOCAL EnableExtensions EnableDelayedExpansion & mode con:cols=140 lines=60 & ',driveLetter, '& cd ', directory, ' & color f0 & chcp & VERIFY ON & title ',driveLetter,'\\[...]\\',baseName,'\\ & echo off  & echo SETLOCAL EnableExtensions EnableDelayedExpansion & VERIFY & echo current drive is ',driveLetter,' & echo Current working directory is ', directorySym,' & echo Absolute: ', directory,' & echo. & @echo on & prompt [POSEIDON CMD]:'])
		retcode = subprocess.Popen(["cmd", "/K",  cmd])

	def is_enabled(self):
		return self.view.file_name() and len(self.view.file_name()) > 0

def getShortPath(long_name):
	output_buf_size = 0
	while True:
		output_buf = ctypes.create_unicode_buffer(output_buf_size)
		needed = _GetShortPathNameW(long_name, output_buf, output_buf_size)
		if output_buf_size >= needed:
			return output_buf.value
		else:
			output_buf_size = needed