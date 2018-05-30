VERSION = 1.0

.PHONY: start dev_up composer-install bower dbmigrate

ssh:
	docker exec -it magento_php /bin/bash

chmod-file: 
	chmod -R 777 source/web/app/uploads/cache/

composer-install:
	docker run --rm -v $$(pwd)/src:/app  -v $$(pwd)/data/composer:/composer  -e LOCAL_USER_ID=$$(id -u $(USER)) ngtrieuvi92/composer composer install --ignore-platform-reqs

bootstrap:
	make mapping_domain && make add_config && echo "--DONE--\n"

build:
	docker-compose build --no-cache

dev_up:
	docker-compose up -d --remove-orphans

down:
	docker-compose down

ps:
	docker-compose ps

logs:
	docker-compose logs

stop:
	docker stop $$(docker ps -a -q)

delete:
	docker rm $$(docker ps -a -q)

dbmigrate-migration:
	docker exec waitrr_website_devtools doctrine-migrations migrations:migrate -n

dbmigrate-generate:
	docker exec waitrr_website_devtools doctrine-migrations migrations:generate

mapping_domain:
	chmod +x devops/script/mapping_domain.sh && devops/script/mapping_domain.sh

add_config: 
	chmod +x devops/script/copy_config.sh && devops/script/copy_config.sh

hotel:
	hotel add http://localhost:17001 --name magento-app
	hotel add http://localhost:17002 --name adminer.magento-app