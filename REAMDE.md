logrotate cfg for VyOS. still implement.


## Output example.

	/var/log/squid/store.log {
		weekly
		rotate 5
		copytruncate
		compress
		notifempty
		missingok
		postrotate
		  /usr/sbin/squid -k rotate
		endscript
	}


## Configuration plan.

	set system logrotate squid path /var/log/squid/store.log
	set system logrotate squid rotate 5
	set system logrotate squid compress
	set system logrotate squid notifempty
	set system logrotate squid missingok
	set system logrotate squid postrotate '/usr/sbin/squid -k rotate'
