#!/bin/bash

dockerFile=$(./docker/bin/readenv.sh DC_DOCKERFILE ./docker/.env)
dockerContainer=$(./docker/bin/readenv.sh DC_CONTAINER ./docker/.env);

echo $dockerFile
echo $dockerContainer

docker compose -f $dockerFile exec $dockerContainer bash
