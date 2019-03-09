#/bin/bash -

set -ex

CONTAINAER_HOST="coq"
IMAGE="my/${CONTAINAER_HOST}"
CONTAINER="my${CONTAINAER_HOST}_container"

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
                    -v ${HOME}/.Xauthority:/root/.Xauthority:rw \
                    ${WORK_VOLUME} \
                    ${IMAGE}"
#                   --hostname "${CONTAINAER_HOST}" \
#                    -v ${HOME}/.Xauthority:/xfiles/.Xauthority:rw \
