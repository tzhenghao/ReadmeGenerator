# Name: Zheng Hao Tan
# Email: tanzhao@umich.edu
# Date: May 30, 2014

#!/bin/bash
# This shell script generates a templated README file with the format below:

header='================='
subheader='-----------------'
cat <<- eof
	(Insert title here)
	$header

	Introduction
	$subheader

	Installation
	$subheader

	Usage
	$subheader

	More Program Options
	$subheader

	Software Used
	$subheader

	1.
	2.
	3.
	4. 

	Support
	$subheader

	If you have any questions/concerns, please feel free to contact me.
	My email address is tanzhao@umich.edu
eof

# Add shell script message here that displays current progress of the program.
