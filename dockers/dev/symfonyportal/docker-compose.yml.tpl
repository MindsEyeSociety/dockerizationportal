version: '2'
services:
  web:
    build:
      context: .
      dockerfile: Dockerfile-nginx
    networks:
      default:
        ipv4_address: 172.16.70.15
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
        ipv4_address: 172.16.70.16
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
        ipv4_address: 172.16.70.17
    environment:
      - MYSQL_ROOT_PASSWORD=mesportal
      - MYSQL_DATABASE=mesportal
      - MYSQL_PASSWORD=mesportal
    volumes:
      - ./var/mysql:/var/lib/mysql
      - ./docker:/docker
#  redis:
#    image: redis:5
#    networks:
#      default:
#        ipv4_address: 172.16.70.18

networks:
  default:
    external:
      name: dev_toptal_mes_net
