#!/bin/bash
sed "s/tagVersion/$1/g" app-deployment.yml > app-deployment-v1.yml
