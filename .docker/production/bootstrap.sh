#!/bin/bash

set -xe
BASE_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../../ && pwd )

cd ${BASE_DIR}/.docker/production

aws s3 cp s3://uql/appname/settings.environment.php ${BASE_DIR}/public/sites/default/settings.environment.php

rm -f /etc/php.d/15-xdebug.ini

if [ "${NEWRELIC_LICENSE}" != "" ]; then
  sed -i "s/NEWRELIC_LICENSE/${NEWRELIC_LICENSE}/" /etc/nginx/conf.d/drupal7.conf
fi

exec /usr/sbin/php-fpm --nodaemonize
