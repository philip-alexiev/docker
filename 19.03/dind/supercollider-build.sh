#!/bin/bash

docker build -f Dockerfile -t registry.supercollider.vmware.com/control-plane/sc-python-docker-dind:19.03  .
docker push registry.supercollider.vmware.com/control-plane/sc-python-docker-dind:19.03
