version: '2'
services:
  web:
    build:
      context: .
      dockerfile: Dockerfile-nginx
    networks:
      default:
        ipv4_address: 172.16.70.12
    environment:
      - MYSQL_ROOT_PASSWORD=mesportal
      - MYSQL_DATABASE=mesportal
    depends_on:
      - db
    links:
      - db
      - fpm
    volumes_from:
      - fpm
  fpm:
    build:
      context: .
      dockerfile: Dockerfile-fpm
    networks:
      default:
        ipv4_address: 172.16.70.13
    depends_on:
      - db
    links:
      - db
    volumes:
      - DEV_REPO_1:/portal
      - ./docker:/docker
  db:
    image: "mysql:8.0"
    command: ['--character-set-server=utf8mb4', '--collation-server=utf8mb4_unicode_ci','--default-authentication-plugin=mysql_native_password' ]
    networks:
      default:
        ipv4_address: 172.16.70.14
    environment:
      - MYSQL_ROOT_PASSWORD=mesportal
      - MYSQL_DATABASE=mesportal
      - MYSQL_PASSWORD=mesportal
    volumes:
      - ./var/mysql:/var/lib/mysql
      - ./docker:/docker

networks:
  default:
    external:
      name: dev_toptal_mes_net
