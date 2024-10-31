version: '2'
services:
  web:
    build:
      context: .
      dockerfile: Dockerfile-web
    networks:
      default:
        ipv4_address: 172.16.70.25
    environment:
      - MYSQL_ROOT_PASSWORD=portal2024
      - MYSQL_DATABASE=portal2024
    depends_on:
      - api
    links:
      - api
    volumes_from:
      - api
  api:
    build:
      context: .
      dockerfile: Dockerfile-api
    networks:
      default:
        ipv4_address: 172.16.70.26
    depends_on:
      - db
    links:
      - db
    volumes:
      - DEV_REPO_1:/portal2024
      - ./docker:/docker
  db:
    image: "mysql:8.0"
    command: ['--character-set-server=utf8mb4', '--collation-server=utf8mb4_unicode_ci','--default-authentication-plugin=mysql_native_password' ]
    networks:
      default:
        ipv4_address: 172.16.70.27
    environment:
      - MYSQL_ROOT_PASSWORD=portal2024
      - MYSQL_DATABASE=portal2024
      - MYSQL_PASSWORD=portal2024
    volumes:
      - ./var/mysql:/var/lib/mysql
      - ./docker:/docker


networks:
  default:
    external:
      name: dev_toptal_mes_net
