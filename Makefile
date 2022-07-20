all: start

start:
	@mkdir -p /home/jtrancos/data/mariadb
	@mkdir -p /home/jtrancos/data/wordpress
	docker-compose -f ./srcs/docker-compose.yml up -d --build

stop:
	docker-compose -f ./srcs/docker-compose.yml down

fclean:
	docker-compose -f ./srcs/docker-compose.yml down -v
	@rm -rf /home/jtrancos/data

re:	fclean all