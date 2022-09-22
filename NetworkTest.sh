
# use wget to test connection to google.com
wget -q --spider http://google.com


# if return code is 0 (command succeeded) => connected
if [ $? -eq 0 ]; then
	# ping loopback ip
	ping 127.0.0.1 -c 1 > /tmp/PINGRESULTS.TXT
	# ping gateway 8 times with 1kb
	ping $(ip route list | awk ' /^default/ {print $3}') -c 8 -s 1016 >> /tmp/PINGRESULTS.TXT
	# get DNS of qu.edu.qa
	dig qu.edu.qa A >> /tmp/PINGRESULTS.TXT

# if return code is not 0 => not connected
else
	# ping localhost once
	ping $(hostname) -c 1 > /tmp/NETINFO.TXT
	# display IP config
	ifconfig > /tmp/NETINFO.TXT
	# display routes
	route -n > /tmp/NETINFO.TXT
	# sleep 20 sec then reboot
	echo "Rebooting in 20 seconds!"
	sleep 20;
	echo "Rebooting Now!"
	reboot
fi
