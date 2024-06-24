#!/bin/bash
set -euo pipefail

NETWORK_OPTION=""
if [ "${NETWORK}" == "host" ]; then
  NETWORK_OPTION="--network host"
elif [ -n "${NETWORK}" ]; then
  NETWORK_OPTION="--network ${NETWORK} -p ${SQL_PORT}:2881 -p ${RPC_PORT}:2882"
else
  NETWORK_OPTION="-p ${SQL_PORT}:2881 -p ${RPC_PORT}:2882"
fi

if [ "${MODE}" == "slim" ]; then
  OB_ENVIRONMENT_OPTIONS=("-e MODE=slim")
else
  OB_ENVIRONMENT_OPTIONS=(
    "-e MODE=${MODE}"
    "-e OB_CLUSTER_NAME=${CLUSTER_NAME}"
    "-e OB_TENANT_NAME=${TENANT_NAME}"
    "-e OB_MEMORY_LIMIT=${MEMORY_LIMIT}"
    "-e OB_SYSTEM_MEMORY=${SYSTEM_MEMORY}"
    "-e OB_DATAFILE_SIZE=${DATAFILE_SIZE}"
    "-e OB_LOG_DISK_SIZE=${LOG_DISK_SIZE}"
  )

  if [ -n "${SYS_ROOT_PASSWORD}" ]; then
    OB_ENVIRONMENT_OPTIONS+=("-e OB_SYS_PASSWORD=${SYS_ROOT_PASSWORD}")
  fi
fi

if [ -n "${TENANT_ROOT_PASSWORD}" ]; then
  OB_ENVIRONMENT_OPTIONS+=("-e OB_TENANT_PASSWORD=${TENANT_ROOT_PASSWORD}")
fi

if [ -n "${INIT_SQL}" ]; then
  mkdir sql
  echo "${INIT_SQL}" >> ./sql/init.sql
  OB_ENVIRONMENT_OPTIONS+=("-v ${PWD}/sql:/root/boot/init.d")
fi

DOCKER_RUN_OPTIONS=(
  "--name ${CONTAINER_NAME}"
  "${NETWORK_OPTION}"
  "${OB_ENVIRONMENT_OPTIONS[@]}"
)

DOCKER_RUN_CMD="docker run ${DOCKER_RUN_OPTIONS[@]} -d ${IMAGE_NAME}:${IMAGE_TAG}"

echo "$DOCKER_RUN_CMD"
eval "$DOCKER_RUN_CMD"
