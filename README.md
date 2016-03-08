# docker-alias-functions
Docker aliases and functions.

#### Installation

##### Install for Zsh
    $ curl -fsSL https://raw.githubusercontent.com/thomasbisignani/docker-alias-functions/master/.zshrc >> ~/.zshrc && source ~/.zshrc

##### Install for Bash
    $ curl -fsSL https://raw.githubusercontent.com/thomasbisignani/docker-alias-functions/master/.zshrc >> ~/.bashrc && source ~/.bashrc

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
| docker-ls     |                             | Show IDs, IPs Addresses and images of containers running. |
| docker-ip     | docker-ip `containerId`             | Show the IP Address of a container id. |
|               | docker-ip last             | Show the IP Address of the last created container. |
|               | docker-ip all              | Show all IP Addresses of all containers running. (docker-ls) |
|               | docker-ip help             | Display help. |
| docker-bash   | docker-bash `containerId`           | Create a new Bash session. |
| docker-destroy   | docker-destroy `containerId`           | Stop and remove a container. |
