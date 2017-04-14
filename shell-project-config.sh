#!/bin/bash

# Directory of this shellscript
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# path to dev dir
alias dev_dir="cd $DIR/vol_source/"

# phpunit - execute phpunit command through container 
# alias dphpunit="docker exec -i docker_php_1 bash -c 'cd /path/to/tests/ && phpunit'"

# useful Docker functions
# from https://gist.github.com/rafaeltuelho/b87dbe50cbbe0666677b
dock-run()  { sudo docker run -i -t --privileged $@ ;}
dock-exec() { sudo docker exec -i -t $@ /bin/bash ;}
dock-log()  { sudo docker logs --tail=all -f $@ ;}
dock-port() { sudo docker port $@ ;}
dock-vol()  { sudo docker inspect --format '{{ .Volumes }}' $@ ;}
dock-ip()   { sudo docker inspect --format '{{ .NetworkSettings.IPAddress }}' $@ ;}
dock-rmc()  { sudo docker rm `sudo docker ps -qa --filter 'status=exited'` ;}
dock-rmi()  { sudo docker rmi -f `sudo docker images | grep '^<none>' | awk '{print $3}'` ;}
