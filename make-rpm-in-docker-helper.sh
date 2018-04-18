#!/bin/bash

yum install -y rpm-build make gdb less python-argparse python-requests
sed -i -e 's/\(%dist .el[0-9]*\).centos/\1/ ' /etc/rpm/macros.dist
groupadd -g $DOCKER_GID $DOCKER_USERNAME
useradd -u $DOCKER_UID -g $DOCKER_GID -G wheel --no-create-home $DOCKER_USERNAME
su $DOCKER_USERNAME -c "make rpm"
