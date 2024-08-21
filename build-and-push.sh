#!/bin/bash
TAGS=( $(find ./php-* -maxdepth 1 -type d -printf '%f\n') ) 

for tag in "${TAGS[@]}"
do
	echo "  "
    echo "Start build of ${tag} ======================================================================================="
    docker buildx build --push --tag davidetriso/symfony:${tag} --output type=image --platform linux/arm64,linux/amd64 ./${tag}
    echo "Built of ${tag} completed ==================================================================================="
    echo "  "
done