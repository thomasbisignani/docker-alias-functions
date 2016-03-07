# -----------------------
# Docker alias/functions
# -----------------------

# Short aliases
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dpsl='docker ps -l -q'
alias di='docker images'

# Create a new Bash session (docker-bash <id>)
function docker-bash() {
	if [[ -z "$@" ]]; then
		 echo >&2 "You must supply an argument : <id>"
	else
		docker exec -it $1 bash
    fi
}

# Show IP Addresses of containers running (docker-ip help)
function docker-ip() {
	case "$1" in
		help|--help)
			echo "Usage :"
			echo "\tdocker-ip <id> \t- Show the IP Address of a container id."
			echo "\tdocker-ip last \t- Show the IP Address of the last created container."
			echo "\tdocker-ip all \t- Show all IP Addresses of all containers running."
			;;
		all|'')
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
			;;
		last)
			docker inspect -f {{.NetworkSettings.IPAddress}} $(docker ps -l -q)
	    	;;
		*)
			docker inspect -f {{.NetworkSettings.IPAddress}} $1
	    	;;
    esac
}