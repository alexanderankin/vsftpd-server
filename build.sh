#!/usr/bin/env bash

bases=(
    20.04
    22.04
    23.04
)

dockerfile=Dockerfile

initial=$(head -n 1 "$dockerfile" | cut -d: -f2)

for next in ${bases[@]}; do
    echo starting $next
    sed -i "1s/:.*/:$next/" "$dockerfile"

    echo building this dockerfile:
    # cat "$dockerfile" | sed 's/^/    /'

    echo building:
    docker build . -t next
    version=$(docker run --init --rm --entrypoint '' next sh -c '/usr/sbin/vsftpd -version 0>&1' | awk ' { print $NF }')
    echo $version

    tag="daveankin/vsftpd-server:$version-$next"
    echo pushing to $tag

    docker tag next $tag
    # docker push $tag
done

sed -i '1s/.*/FROM ubuntu:22.04/' "$dockerfile"
