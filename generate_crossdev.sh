#!/bin/bash
set -eou pipefail

CROSSDEV_CONTAINER_PREFIX=crossdev-docker_
GENERIC_CROSSDEV_CONTAINER_NAME="${CROSSDEV_CONTAINER_PREFIX}generic"

_usage(){
	echo "usage: $0 <target architecture>"
	exit 1
}

_docker_count_images(){
	docker images | grep "$1" | head -n-1 | wc -l
}

_generate_arch(){
	[ $( _docker_count_images "$GENERIC_CROSSDEV_CONTAINER_NAME" ) -eq 0 ] && {
		docker build -t "$GENERIC_CROSSDEV_CONTAINER_NAME" .
	}
	echo "Generating ${CROSSDEV_CONTAINER_PREFIX}$1"
	echo | docker build -t "${CROSSDEV_CONTAINER_PREFIX}$1" - <<EOF
	FROM $GENERIC_CROSSDEV_CONTAINER_NAME
	RUN crossdev -t $1
EOF
}

[ $# -eq 1 ] && {
	_generate_arch $1
} || {
	_usage
}
