docker-compose up -d --build
sudo chown $(whoami) drupal-root
./bin/misc/install_new_drupal.sh