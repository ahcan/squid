docker run --name squid -itd -p 8001:3128\
	--restart always\
	--mount type=bind,source=/Users/nguyenhuy/docker-config/squid/squid.conf,target=/etc/squid/squid.conf\
	--mount type=bind,source=/Users/nguyenhuy/docker-config/squid/logs,target=/var/log/squid\
	--mount type=bind,source=/Users/nguyenhuy/docker-config/squid/passwords,target=/etc/squid/passwords\
    ubuntu-squid
