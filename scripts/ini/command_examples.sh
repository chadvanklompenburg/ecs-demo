#!/usr/bin/env bash
docker search node --filter "is-official=true" --filter "stars=10"
#./parse_tags.js --url='https://registry.hub.docker.com/v2/repositories/library/node/tags/'
#URL: https://hub.docker.com/_/node/
docker pull node:7.6.0
docker images
docker ps
docker inspect node:7.6.0
docker run ecs-demo
#docker ps, docker stop
docker run -ti ecs-demo
docker run -p 3000:3000 -ti ecs-demo
# docker ps --filter "status=exited" --format "{{.ID}}\t{{.Image}}\t{{.CreatedAt}}
docker ps --filter "status=exited" --format "{{.ID}}\t{{.Image}}\t{{.CreatedAt}}" | awk '{ print $1 }' | xargs docker rm
