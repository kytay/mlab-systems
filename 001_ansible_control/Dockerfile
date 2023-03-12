FROM ubuntu:jammy

ARG ARG_TZ=Asia/Singapore
ARG ARG_CONTAINER_USER=ansible

# Environment for timezone setup
ENV TZ=${ARG_TZ}
ENV CONTAINER_USER=${ARG_CONTAINER_USER}

# Basic commands for ubuntu images
RUN apt-get update && \
apt-get install -y --no-install-recommends \
curl ca-certificates apt-transport-https gnupg lsb-release tzdata

# TimeZone Configuration
RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && \
echo $TZ /etc/timezone && \
dpkg-reconfigure --frontend noninteractive tzdata

# Setup python3 and dependencies
RUN apt-get install -y \
python3 python3-pip

# Setup container user
RUN apt-get install -y sudo && \
adduser ${CONTAINER_USER} && \
usermod -aG sudo ${CONTAINER_USER} && \
echo "${CONTAINER_USER}:password" | chpasswd

# Setup non-privilege user 
USER ${CONTAINER_USER}
WORKDIR /home/${CONTAINER_USER}/projects

# Setup ansible and argcomplete
RUN python3 -m pip install --user ansible argcomplete

# Export volume
VOLUME [ "/home/${CONTAINER_USER}/projects" ]

# Auto source ~/.profile
CMD /bin/bash -c "source ~/.profile && bash"