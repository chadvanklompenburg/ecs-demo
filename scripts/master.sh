#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPOSITORY="474134703240.dkr.ecr.us-east-1.amazonaws.com/ecs-demo"
export TAG="none"

generate_tag(){
    NOW=$(date +"%Y-%m-%d-%H-%M-%S")
    echo "${REPOSITORY}:ecs-demo_index_${NOW}"
}

generate_tag2(){
    NOW=$(date +"%Y-%m-%d-%H-%M-%S")
    echo "${REPOSITORY}:ecs-demo_index2_${NOW}"
}

show_menu(){
    PS3="(Working Image:${TAG}) : "
    options=("Build Image" "Build Image 2" "Push Image" "Quit")
    select opt in "${options[@]}"; do
        case $opt in
            "Build Image")
                TAG=$(generate_tag)
                ( cd $DIR/../image && docker build --build-arg ENTRYPOINT=index.js -t $TAG .)
                break
                ;;
            "Build Image 2")
                TAG=$(generate_tag2)
                (cd $DIR/../image && docker build --build-arg ENTRYPOINT=index2.js -t $TAG .)
                break
                ;;
            "Push Image")
                if [ "$TAG" != "none" ]; then
                    echo "Pushing: ${TAG}"
                    aws ecr get-login | bash
                    docker push $TAG
                fi
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
