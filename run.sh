#!/bin/bash

docker="winter_2021_nvidia"
uid=$(id -u $USER)
repository="$(pwd)/openbot"
workspace="/catkin_ws"

xhost +local:root

docker run -it --rm --env="DISPLAY" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
           --volume="$HOME/.Xauthority:/root/.Xauthority:rw" --name=$docker \
           --privileged --ipc="host" --cap-add=IPC_LOCK --cap-add=sys_nice --user $uid:$uid \
           -e HOME=/home/openbot -e ROS_HOSTNAME=localhost -e ROS_MASTER_URI=http://localhost:11311 \
          --workdir $workspace --volume $repository:$workspace/src/openbot \
          --network="host" --gpus all $docker
xhost -local:root
