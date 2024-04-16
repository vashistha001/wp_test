source .env

echo "#####################################################"
echo "### Installer step 1/3: Get Drupal 9.4.x codebase ###"
echo "#####################################################"
sleep 2
./bin/composer create-project --no-interaction drupal/recommended-project:~9.4.0 .
./bin/composer require --no-interaction drush/drush

printf "\n"
echo "######################################################"
echo "### Installer step 2/3: Install database           ###"
echo "######################################################"
sleep 2
./bin/drush site:install --db-url=mysql://$DB_USER_NAME:$DB_USER_PSWD@mariadb:3306/$DB_NAME -y --site-name=$COMPOSE_PROJECT_NAME standard

printf "\n"
echo "######################################################"
echo "### Installer step 3/3: Configure Drupal           ###"
echo "######################################################"
sleep 2
sudo chmod 777 drupal-root/web/sites/default/files/ -R
echo "\$settings['trusted_host_patterns'] = ['localhost'];" | sudo tee -a drupal-root/web/sites/default/settings.php &> /dev/null
mkdir drupal-root/drush
echo -e "options:\r   uri: 'http://localhost'" > drupal-root/drush/drush.yml

printf "\n"
echo "######################################################"
echo "### Installer extra configuration: Redis as cache  ###"
echo "######################################################"
./bin/composer require --no-interaction 'drupal/redis:^1.5'
./bin/drush pm:enable redis
echo "\$settings['redis.connection']['interface'] = 'PhpRedis';" | sudo tee -a drupal-root/web/sites/default/settings.php &> /dev/null
echo "\$settings['redis.connection']['host'] = 'redis';" | sudo tee -a drupal-root/web/sites/default/settings.php &> /dev/null
echo "\$settings['redis.connection']['password'] = '$REDIS_PSWD';" | sudo tee -a drupal-root/web/sites/default/settings.php &> /dev/null
echo "\$settings['cache']['default'] = 'cache.backend.redis';" | sudo tee -a drupal-root/web/sites/default/settings.php &> /dev/null

./bin/drush cache:rebuild
./bin/drush cron
echo "######################################################"
echo "### Drupal status                                  ###"
echo "######################################################"
./bin/drush status

printf "\n"
echo "######################################################"
echo "### Visit your Drupal website at http://localhost  ###"
echo "######################################################"