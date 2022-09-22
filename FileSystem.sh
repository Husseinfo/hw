function first() {
	# get disk usage
	df -h > /tmp/Disk_Usage.txt
	# write cpu info to /tmp
	cat /proc/cpuinfo > /tmp/cpu_inf.txt
	# write kernel info to /tmp
	lsmod > /tmp/Messages_Log.txt
	# wordcount for message log
	wc -l /tmp/Messages_Log.txt > /tmp/Message_count.txt
	# compress files
	tar cvf Phase1.tar.bz2 HOLDFILE.txt HOLDFILE.txt /tmp/Message_count.txt
	# copy compressed file to directory
	d = $(date +%d%H%M%S)
	mkdir $d
	cp Phase1.tar.bz2 $d/
}


function second() {
	# get directory name
	d = $(date +%y%m%d%H%M%S)
	# create dir
	mkdir $d
	# copy files to dir
	cp $HOME/* dir/
	# change files permissions to read only
	chmod 444 * -R
}


function third() {
	# find files with read permission and count them
	ls -l | awk '$1 ~ /r/' 20092905553 | wc -l
	echo "End: $(date +%T)"
}


first
second
third

