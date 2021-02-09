#!/bin/bash

docker build -f Dockerfile -t registry.supercollider.vmware.com/control-plane/sc-python-docker:19.03  .
docker push registry.supercollider.vmware.com/control-plane/sc-python-docker:19.03
