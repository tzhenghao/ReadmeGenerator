# Name: Zheng Hao Tan
# Email: tanzhao@umich.edu
# Date: May 30, 2014
#!/bin/bash
# This shell script generates a templated README file with the format below:

echo "Project title?"
read title

# Gets the size of the title
# Corresponds with a header of same length
size=${#title}
header=""
for i in $(seq "$size"); do
  header=$header"="
  set $header
done

echo -e "\nSoftware used?"
read software

software_arr=()

while true; do
  # Breaks and ignores rest of loop on 'done'
  if [ "$software" == "done" ]; then
    break
  fi
  
  # Adds newly-read $software into array
  software_arr+=("$software")

  # Prompts for next software
  echo -e "\nAnd then?"
  read software
done

# Array of software
software_arr=("${software_arr[@]}")

# It's odd why I can't add newlines into $readme1
# So I'm adding them here
software_list="\n\n"

# First number of the list
# Incremented each iteration
num=1
# Iterates through software array and makes nicely formatted list
for i in "${software_arr[@]}"; do
  # Concatenates previous item with next
  software_list=$software_list"$((num++)). $i\n"
  
  # Makes assignment permanent
  set $software_list
done

# First section, added $title
readme1=$(cat <<- EOF
	$title
	$header

	Introduction
	------------

	Installation
	------------

	Usage
	-----

	More Program Options
	--------------------
	
	Software Used
	-------------
	
EOF
)

readme2=$(cat <<- EOF

	Support
	-------

	If you have any questions/concerns, please feel free to contact me.
	My email address is tanzhao@umich.edu
EOF
)

# Concatenates first, second and software section into $readme
readme=$readme1$software_list$readme2

# Does pretty-printing of $readme with newlines
# Added newline for brevity
echo -e "\n$readme"

# Gets present working directory and stringifies it
pwd_="`pwd`"
if [ -f $pwd_/README.md ]; then
  echo "ERROR: You already have a README.md!"
else
  echo -e "$readme" > README.md
  echo "README.md generated."
fi

