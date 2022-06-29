#!/bin/bash
set -eux

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

set +e
docker rm -f test_container
set -e

docker build -t test_container .

docker run --name test_container -v "$DIR:/test_folder" -t test_container bash /test_folder/run_internal.sh 
