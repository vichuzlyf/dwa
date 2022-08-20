#!/usr/bin/env bash

docker rm $(docker ps -a -f status=exited -q)
# docker rmi $(docker images --filter "dangling=true" -q --no-trunc)

docker pull owasp/zap2docker-live

echo DEBUG - mkdir -p $PWD/out
mkdir -p $PWD/out

echo DEBUG - chmod 777 $PWD/out
chmod 777 $PWD/out

test -d ${PWD}/out \
  && docker run -v $(pwd)/out:/zap/wrk/:rw -t owasp/zap2docker-live zap-api-scan.py -t $TARGET_URL -f openapi -d -r zap_scan_report.html

echo DEBUG - Finding all files in workspace
find $PWD


# sudo docker cp $(sudo docker ps -l -q):/home/zap/.ZAP_D/zap.log ${WORKSPACE}
# the goal is to get the following to work, 
# copying the zap_scan_report.html from the Docker container 
# to the Jenkins workspace, as a start:
# sudo docker cp \ 
#   $(docker ps -l -q):/home/zap/.ZAP_D/zap_scan_report.html \
#   ${WORKSPACE}/zap_scan_report.html

if test -f ${PWD}/out/zap_scan_report.html; then
  mv ${PWD}/out/zap_scan_report.html ${PWD}
  rm -rf ${PWD}/out
  echo DEBUG - Finding all files in workspace
  find $PWD
  exit 0
else
  echo "zap_scan_report.html not found!"
  exit 1
fi
