#!/bin/bash
TAGS=( $(find ./php-* -maxdepth 1 -type d -printf '%f\n') ) 

for tag in "${TAGS[@]}"
do
	echo "  "
    echo "Start build of ${tag} ======================================================================================="
    docker build -t davidetriso/symfony:${tag} ./${tag}
    echo "Built of ${tag} completed ==================================================================================="
    echo "  "
done

docker push --all-tags davidetriso/symfony
