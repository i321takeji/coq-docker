#!/bin/sh -

set -e
umask 022

USERNAME="${COQ_USER}"
USERID="${COQ_UID}"
GROUPID="${COQ_GID}"

init_user() {
  groupadd "${USERNAME}" -g "${GROUPID}"
  useradd "${USERNAME}" -u "${USERID}" -g "${GROUPID}" -m -d "/home/${USERNAME}" -s /bin/bash
  echo 'umask 022' >> "/home/${USERNAME}/.profile"
  echo "cd `pwd`" >> "/home/${USERNAME}/.profile"
  echo "export DISPLAY=$DISPLAY" >> "/home/${USERNAME}/.profile"
  ln -s /xfiles/.Xauthority "/home/${USERNAME}"
  chown "${USERNAME}:${USERNAME}" /coq-work
}


if [ -z "${USERNAME}" ] || [ -z "${USERID}" ] || [ -z "${GROUPID}" ]; then
  bash
else
  init_user

  su - "${USERNAME}"
fi
