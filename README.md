# A smalle example of how to build a docker image for deployment into Amazon ECS
* The docker image is built from the /images directory using /image/Dockerfile
* /scripts/master.sh - example of how to build a docker image and push it to an ECS repository
* /scripts/ini/command\_examples.sh - some docker commands but also calls the parse\_tags.js which will display all tags in a dockerhub repository.
* /scripts/ini/parse\_tags.js - Node example used to list all tags in a dockerhub repository.

