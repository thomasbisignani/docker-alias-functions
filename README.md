# docker-alias-functions
Docker aliases and functions.

#### Docker aliases
| Alias         | Command                     |
|:------------- |:----------------------------|
| dps           | docker ps                   |
| dpsa          | docker ps -a                |
| dpsl          | docker ps -l -q             |
| di            | docker images               |

#### Docker Compose aliases
| Alias         | Command                     |
|:------------- |:----------------------------|
| dcb           | docker-compose build        |
| dcup          | docker-compose up           |
| dcstop        | docker-compose stop         |
| dcrestart     | docker-compose restart      |
| dcps          | docker-compose ps          |
| dcrm          | docker-compose rm          |

#### Docker functions
| Alias         | Options                     | Informations                |
|:------------- |:----------------------------|:----------------------------|
| docker-ip     | docker-ip `containerId`             | Show the IP Address of a container id. |
|               | docker-ip last             | Show the IP Address of the last created container. |
|               | docker-ip all              | Show the IP Address of the last created container. |
|               | docker-ip help             | Display help. |
| docker-bash   | docker-bash `containerId`           | Create a new Bash session |
