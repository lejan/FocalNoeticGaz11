FROM  osrf/ros:noetic-desktop-full
LABEL maintainer="lejan"

ARG user="openbot"
ARG uid="1000"

# Setup environment
ENV ROS_DISTRO=noetic
ENV GZ_VERSION=11

USER root

# Setup environment
RUN apt-get update && apt-get install -y locales gnupg2
RUN locale-gen en_US.UTF-8
ENV \
    LANG=en_US.UTF-8 \
    DEBIAN_FRONTEND=noninteractive \
    TERM=xterm

# Create a user with passwordless sudo
RUN adduser --disabled-password --gecos "Development User"  -u ${uid} ${user}
RUN adduser ${user} sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

#USER ${USER}
USER ${user}

# Automatically source ROS workspace
RUN echo ". /opt/ros/${ROS_DISTRO}/setup.bash" >> /home/${user}/.bashrc
ENV CATKIN_WS_DIR "/catkin_ws"
ENV CATKIN_SETUP_BASH "${CATKIN_WS_DIR}/devel/setup.bash"
RUN echo "[[ -f ${CATKIN_SETUP_BASH} ]] && . ${CATKIN_SETUP_BASH}" >> /home/${user}/.bashrc

USER root

RUN apt-get install tmux -y
RUN apt-get install ros-noetic-teleop-twist-keyboard -y

# Workspace
RUN mkdir -p /catkin_ws/src/ && \
    chown -R ${user} /catkin_ws

USER ${user}
WORKDIR /catkin_ws/
RUN rosdep update
