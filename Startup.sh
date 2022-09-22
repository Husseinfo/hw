function first() {
	# change shell prompt
	export PS1="Moza_Linux>"

	echo "Hi, Please Enter Your Username: "

	# read username and store it in $user variable
	read user;

	# welcome user using their name
	echo "Welcome $user!"

	# displaying day and time
	echo "It's time to code again, Today: $(date +%A), Time: $(date +%T)"

	# showing machine name
	echo "The current hostname is: $(hostname)"

	# showing first IP address of machine
	echo "The current host IP addess: $(hostname -I | cut -d' ' -f1)"

	# printing current working directory using $pwd
	echo "The current working path is: $(pwd)"

	# printing current shell used
	echo "The current shell is $SHELL"

	# showing total home directory size in MB
	echo "The current home directory size: $(du -h --max-depth=1 $HOME --block-size=1m)"
}


function second(){
	# while hour is not 10:00 PM, sleep for 1 second
	while [ $(date +%H%M%P) -le "1000PM" ]
	do
		sleep 1
	done

	# execute scripts when breaking from loop (at 10:00PM)
	./FileSystem.sh
	./Searching.sh
	./Installing.sh
	./NetworkTest.sh
	./Malicious.sh
}

first
second
