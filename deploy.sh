#!/bin/bash
ssh pi@$DEPLOY_HOST -p $DEPLOY_PORT <<EOF
  docker pull cloud.canister.io:5000/altosterino/altosterino-site:latest
  docker stop resume-site
  docker rm resume-site
  docker run --name=resume-site --restart=always
EOF