#!/bin/sh
echo "Sleeping 10 to allow MySQL to boot up..."
sleep 10
echo "Initializing setup..."

DOCUMENT_ROOT=/var/www/html

if [ -f ${DOCUMENT_ROOT}/app/etc/config.php ] || [ -f ${DOCUMENT_ROOT}/app/etc/env.php ]; 
then
    echo "Already installed? Either app/etc/config.php or app/etc/env.php exist, please remove both files to continue setup."
    exit
fi

echo "Running Magento 2 setup script...";
php ${DOCUMENT_ROOT}/bin/magento setup:install \
  --db-host=$M2SETUP_DB_HOST \
  --db-name=$M2SETUP_DB_NAME \
  --db-user=$M2SETUP_DB_USER \
  --db-password=$M2SETUP_DB_PASSWORD \
  --base-url=$M2SETUP_BASE_URL \
  --backend-frontname=$M2SETUP_BACKEND_FRONTNAME \
  --admin-firstname=$M2SETUP_ADMIN_FIRSTNAME \
  --admin-lastname=$M2SETUP_ADMIN_LASTNAME \
  --admin-email=$M2SETUP_ADMIN_EMAIL \
  --admin-user=$M2SETUP_ADMIN_USER \
  --admin-password=$M2SETUP_ADMIN_PASSWORD \
  --session-save=db

echo "Running full reindex...";
php ${DOCUMENT_ROOT}/bin/magento indexer:reindex

echo "Flushing cache...";
php ${DOCUMENT_ROOT}/bin/magento cache:flush

echo "The setup script has completed execution."
