from distutils.core import setup, Extension

setup(
	name='pcap',
	version='0.1',
	author='Pegerto Fernandez',
	author_email='pegerto@gmail.com',
	py_modules=['pcap'],
	ext_modules=[Extension("_pcap",
				["pcap.i","pcap.c"],
				libraries = ['pcap'],
				library_dirs = ['/usr/lib/i386-linux-gnu/'])	#TODO: finding required.
				]
	)