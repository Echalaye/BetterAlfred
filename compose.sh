#!/usr/bin/env bash
set -e
_self="${0##*/}"

source ".env"
export MDW_PROJECT_DIR=$(dirname "${envfile}")
export MDW_PROJECT_DATA_DIR="./data"
export MDW_PROJECT_PERSISTENT_MOODLEDATA_DIR="./moodledata"
export MDW_PROJECT_PERSISTENT_DATABASE_DIR="./database"
export MDW_PROJECT_DOCKER_LOCAL="./docker"
export USER=$(id -u)

dockerconfigfiles=""
for configfile in "${MDW_PROJECT_DOCKER_LOCAL}"/*.yml; do
    dockerconfigfiles="${dockerconfigfiles} -f ${configfile}"
done
"bin/moodle-docker-compose" ${dockerconfigfiles} "${@}"