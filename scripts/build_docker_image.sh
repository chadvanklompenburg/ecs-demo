#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPOSITORY="474134703240.dkr.ecr.us-east-1.amazonaws.com/ecs-demo"

generate_tag(){
    NOW=$(date +"%Y-%m-%d-%H-%M-%S")
    echo "${REPOSITORY}:ecs-demo_index${NOW}"
}

generate_tag2(){
    NOW=$(date +"%Y-%m-%d-%H-%M-%S")
    echo "${REPOSITORY}:ecs-demo_index2${NOW}"
}

show_menu(){
    PS3="What you want me do? : "
    options=("Build/Push Image" "Build/Push Image 2" "Quit")
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
            "Build/Push Image 2")
                (
                    TAG=$(generate_tag2)
                    cd $DIR/../image && docker build -t $TAG -f Dockerfile2 .
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
