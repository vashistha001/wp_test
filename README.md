# Docker Compose for Drupal 9

This Docker Compose template is meant to run a Drupal 9 application on Linux, considering the official [Drupal system requirements](https://www.drupal.org/docs/system-requirements), shipped with a curated collection of developer tools.

**Drupal version: 9.4.x**


## Index

1. [How to use this Docker template for Drupal](#how-to-use-this-drupal-docker-template)
   - [Docker stack](#docker-stack)
   - [Requirements](#requirements)
   - [Installation](#installation)
   - [Managing your Drupal application](#managing-your-drupal-application)
   - [Customization and advanced configuration](#customization-and-advanced-configuration)
2. [License](#license)
3. [About](#about)


## How to use this Drupal Docker template

### Docker stack

* PHP 8.1 with Apache 2, powered by Debian 11 "Bullseye"
* MariaDB 10.8
* phpMyAdmin 5.1
* Redis 6.2
* Redis Commander 0.8
* Mailhog 1.0.1


### Requirements:

- [Linux OS](https://en.wikipedia.org/wiki/List_of_Linux_distributions)
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)


### Installation:

1. Clone this project: `git clone https://gitlab.com/deviktta/docker-for-drupal.git`
2. Create the Docker environment file with the provided default (`cp default.env .env`) and edit it with your project values.
3. Run the Docker containers: `docker-compose up -d --build`
4. Update directories' permissions: `sudo chown $(whoami) ./drupal-root && chmod +x ./bin/ -R`
5. Place your Drupal's codebase in `./drupal-root`; otherwise, create a new fresh Drupal by running `./bin/misc/install_new_drupal.sh`
6. Visit your site by navigating to http://localhost.


### Managing your Drupal application:

| Title           | URL                                            |
|-----------------|------------------------------------------------|
| Drupal website  | [http://localhost](http://localhost)           |
| PhpMyAdmin      | [http://localhost:8081](http://localhost:8081) |
| Redis Commander | [http://localhost:8082](http://localhost:8082) |
| Mailhog         | [http://localhost:8025](http://localhost:8025) |

**Available tools (see executables in `./bin/`)**
* Composer: `./bin/composer`
* Drush: `./bin/drush`
* Drupal Console: `./bin/drupal`
* PHP Code Sniffer: `./bin/phpcs`
* PhpStan: `./bin/phpstan`
* MySQL: `./bin/mysql` `./bin/mysqldump`
* Redis: `./bin/redis-cli`

Application logs can be found in `./logs` directory.


### Customization and advanced configuration:

**PHP configuration files**
* php.ini: [docker/builds/phpserver/php.ini](./.docker/builds/phpserver/php.ini)
* opcache: [docker/builds/phpserver/opcache.ini](./.docker/builds/phpserver/opcache.ini)
* xdebug: [docker/builds/phpserver/xdebug.ini](./.docker/builds/phpserver/xdebug.ini)

**Apache**
* Virtual hosts: [docker/builds/phpserver/sites-enabled/000-default.conf](./.docker/builds/phpserver/sites-enabled/000-default.conf)


## License
This project is under [MIT License](https://gitlab.com/deviktta/docker-for-drupal/-/blob/master/LICENSE.txt).


## About
Contact e-mail: [deviktta@protonmail.com](mailto:deviktta@protonmail.com); made with love from Barcelona, Catalunya.
