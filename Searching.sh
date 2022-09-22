function first() {
	echo "Searching for Files with reported errors $HOME"
	echo "Please Standby for the Search Results.."
        # searching for files > 500MB
        find . -type f -size +500M > HOLDFILE.txt
	# test file size
	if [[ ! -s HOLDFILE.txt ]] ; then
		# copy HOLDFILE.txt content to OUTFILE.txt
		cp HOLDFILE.txt OUTFILE.txt
		# count HOLDFILE.txt lines and append to HOLDFILE.txt
		wc -l HOLDFILE.txt >> HOLDFILE.txt
	else
		echo "No files were found with reported errors or failed services! Exiting."
	fi
}


function second() {
	cat OUTFILE.txt
}

first
second
