all:
		docker compose -f ./srcs/docker-compose.yml -p inception up -d

down:
		docker compose -f ./srcs/docker-compose.yml -p inception down $(service)

clean:
		docker compose -f ./srcs/docker-compose.yml -p inception down --rmi all

fclean:
		./srcs/requirements/tools/reset.sh

logs:
		docker compose -f ./srcs/docker-compose.yml -p inception logs $(service)

ssl:
		./srcs/requirements/tools/ssl.sh

restart:	down all

rebuild:	clean all

reset:		fclean all