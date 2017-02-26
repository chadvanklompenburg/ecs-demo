#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#NOW=$(date +"%Y-%m-%d-%H-%M-%S")
REPOSITORY="474134703240.dkr.ecr.us-east-1.amazonaws.com/ecs-demo"
#TAG="${REPOSITORY}:ecs-demo_${NOW}"

generate_tag(){
    NOW=$(date +"%Y-%m-%d-%H-%M-%S")
    echo "${REPOSITORY}:ecs-demo_${NOW}"
}

show_menu(){
    PS3="What you want me do? : "
    options=("Build/Push Image" "Quit")
    select opt in "${options[@]}"; do
        case $opt in
            "Build/Push Image")
                (
                    TAG=$(generate_tag)
                    cd $DIR/../image && docker build -t $TAG .
                    aws ecr get-login | bash
                    docker push $TAG
                )
                break
                ;;
            "Quit")
                exit
                ;;
        esac
    done
}

while true; do
    show_menu
done
# (
#     cd $DIR/../docker_files
#     docker build -t ecs-demo .
# )
