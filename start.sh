#/bin/bash -

set -e

DOCKER_ID='bamboog130'
CONTAINAER_HOST="coq:mathcomp-1.7.0"
IMAGE="${DOCKER_ID}/${CONTAINAER_HOST}"
CONTAINER="${DOCKER_ID}${CONTAINAER_HOST}_container"

WORK_DIR="$1"
WORK_VOLUME=""

if [ -n "${WORK_DIR}" ]; then
  if [ -d "${WORK_DIR}" ]; then
    WORK_ABSPATH="$(cd ${WORK_DIR} && pwd)"
    WORK_VOLUME="-v ${WORK_ABSPATH}:/coq-work"
  else
    echo "${WORK_DIR} is NOT directory."
    exit 1
  fi
fi

bash -c "docker run --rm -i -t --net host -e DISPLAY=${DISPLAY} \
                    -e COQ_UID=`id -u` -e COQ_GID=`id -g` \
                    -v ${HOME}/.Xauthority:/xfiles/.Xauthority:rw \
                    ${WORK_VOLUME} \
                    ${IMAGE}"
