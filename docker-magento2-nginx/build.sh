#!/bin/bash
VERSION=$1
docker build -t ecg/magento2-nginx:$VERSION .
