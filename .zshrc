# ----------------------
# Docker alias/functions
# ----------------------
if (which docker > /dev/null)
then
	# Docker standard
	alias dps='docker ps'
	alias dpsa='docker ps -a'
	alias dpsl='docker ps -l -q'
	alias di='docker images'

	# Show IDs, IPs Addresses and images of containers running
 	function docker-ls() {
		docker ps | while read line; do
			if [[ $line == *"CONTAINER ID"* ]]; then
				echo "CONTAINER ID\tIP ADDRESS\tIMAGE"
			else
				ID=$(echo $line|awk '{print $1}')
				IP=$(docker inspect -f "{{ .NetworkSettings.IPAddress }}" $ID)
				IMAGE=$(print $line|awk '{print $2}')
				printf "$ID\t${IP}\t${IMAGE}\n"
			fi
		done;
	}

	# Create a new Bash session
	function docker-bash() {
		if [[ -z "$@" ]]; then
			 echo >&2 "You must supply an argument : <containerId>"
		else
			docker exec -it $1 bash
	    fi
	}

	# Show IP Addresses of containers running
	function docker-ip() {
		case "$1" in
			help|--help)
			    echo "Usage :"
				echo "\tdocker-ip <id> \t- Show the IP Address of a container id."
				echo "\tdocker-ip last \t- Show the IP Address of the last created container."
				echo "\tdocker-ip all \t- Show all IP Addresses of all containers running."
				;;
			all|'')
				docker-ls
				;;
			last)
				docker inspect -f {{.NetworkSettings.IPAddress}} $(docker ps -l -q)
		    	;;
			*)
				docker inspect -f {{.NetworkSettings.IPAddress}} $1
		    	;;
	    esac
	}

	# Stop and remove a container
	function docker-destroy() {
		if [[ -z "$@" ]]; then
			 echo >&2 "You must supply an argument : <containerId>"
		else
			docker stop $1 && docker rm $1
	    fi
	}
fi

# --------------------
# Docker Compose alias
# --------------------
if (which docker-compose exit > /dev/null)
then
	alias dcb='docker-compose build'
	alias dcup='docker-compose up'
	alias dcstop='docker-compose stop'
	alias dcrestart='docker-compose restart'
	alias dcps='docker-compose ps'
	alias dcrm='docker-compose rm'
fi
