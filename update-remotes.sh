#!/bin/sh

echo "Updating magento remote docker images..."
cd magento2devbox-varnish && git pull
cd ../
cd magento2devbox-web && git pull
cd ../
