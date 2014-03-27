#!/bin/bash

### config
TODAY=`date +%Y%m%d`
TMP_DIR="/tmp"
REPO="all-in-one_haproxy"

### exec
mkdir -p ${TMP_DIR}/cookbooks/${REPO}
cd ./${REPO}/
git archive master | tar -x -C ${TMP_DIR}/cookbooks/${REPO}

COUNT=$((`echo \`find ${TMP_DIR}/all-in-one_haproxy_${TODAY}-* | wc -l\`` + 1))

cd ${TMP_DIR}
tar czvf all-in-one_haproxy_${TODAY}-${COUNT}.tar.gz cookbooks/
rm -rf ${TMP_DIR}/cookbooks

