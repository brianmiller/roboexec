podman create \
       --name='roboexec' \
	       -v '/home/brian/Development/docker/docker-roboexec/running_container/cron.d':'/opt/stateful/cron.d':Z \
	       -v '/home/brian/Development/docker/docker-roboexec/running_container/cron.hourly':'/opt/stateful/cron.hourly':Z \
	       -v '/home/brian/Development/docker/docker-roboexec/running_container/cron.daily':'/opt/stateful/cron.daily':Z \
	       -v '/home/brian/Development/docker/docker-roboexec/running_container/cron.weekly':'/opt/stateful/cron.weekly':Z \
	       -v '/home/brian/Development/docker/docker-roboexec/running_container/cron.monthly':'/opt/stateful/cron.monthly':Z \
	       -v '/home/brian/Development/docker/docker-roboexec/running_container/logs':'/opt/stateful/logs':Z \
	       -v '/home/brian/Development/docker/docker-roboexec/running_container/scripts':'/opt/stateful/scripts':Z \
	        localhost/roboexec
