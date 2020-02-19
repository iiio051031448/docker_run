#!/bin/bash

# docker run -it -v /home/dock/Downloads:/usr/Downloads ubuntu64 /bin/bash

# docker run -t -i -v /home/langyj/code:/home/code ubuntu-14.04-qsdk5 /bin/bash
# docker run -t -i -p 22022:22 -v /home/docker/v_dir:/home/docker --add-host git.lyj.com:192.168.11.64 ubuntu-14.04-qsdka /bin/bash 

#docker run -t -i -p 22022:22 -v /work2/wifi2/langyj/v_dir:/home/docker --add-host git.lang.com:192.168.217.129 ubuntu-14.04-qsdka /bin/bash 
# docker run -t -i -p 22022:22 ubuntu-14.04-qsdka /bin/bash 

# docker run -t -i ubuntu-14.04-qsdk /bin/bash

MY_NAME=$(whoami)

echo "run docker with user ${MY_NAME}"

V_MAP="-v /work2/wifi2/langyj/v_dir:/home/docker"

V_MAP="${V_MAP} -v /etc/passwd:/etc/passwd"
V_MAP="${V_MAP} -v /etc/shadow:/etc/shadow"
V_MAP="${V_MAP} -v /etc/group:/etc/group"

V_MAP="${V_MAP} -v /work3/v_docker:/work3/v_docker"
V_MAP="${V_MAP} -v /usr/share/zoneinfo/Asia/Shanghai:/etc/localtime"

V_MAP="${V_MAP} -v /var/www/html/files/AP:/home/http_files"

V_MAP="${V_MAP} -v /home/${MY_NAME}/.vim:/home/${MY_NAME}/.vim"
V_MAP="${V_MAP} -v /home/${MY_NAME}/.vimrc:/home/${MY_NAME}/.vimrc"
V_MAP="${V_MAP} -v /home/${MY_NAME}/.ssh/:/home/${MY_NAME}/.ssh/"
V_MAP="${V_MAP} -v /home/${MY_NAME}/.bash_profile:/home/${MY_NAME}/.bash_profile"
V_MAP="${V_MAP} -v /home/${MY_NAME}/.bashrc:/home/${MY_NAME}/.bashrc"
WITH_USER="--user $(id -u)"

HOST_MAP="--add-host git.lang.com:192.168.217.129"
#HOST_MAP="${HOST_MAP} --add-host wayclouds.git.com:192.168.11.158"

#PORT_MAP="-p 22022:22"

docker run -t -i ${PORT_MAP} ${V_MAP} --privileged=true ${HOST_MAP} ${WITH_USER} ubuntu-14.04-qsdkb-mv /bin/bash 
#docker run -t -i ${PORT_MAP} ${V_MAP} ${HOST_MAP} ubuntu-14.04-qsdkb-mv /bin/bash 
