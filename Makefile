MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
CURRENT_DIR := $(notdir $(patsubst %/,%,$(dir $(MKFILE_PATH))))
ROOT_DIR := /Users/$$USER/Desktop/temp/

initialize:
	mkdir -p ${ROOT_DIR}${CURRENT_DIR}/vendor
	mkdir -p ${ROOT_DIR}${CURRENT_DIR}/node_modules
	ln -s ${ROOT_DIR}${CURRENT_DIR}/vendor
	ln -s ${ROOT_DIR}${CURRENT_DIR}/node_modules

symlink:
	ln -s ${ROOT_DIR}${CURRENT_DIR}/vendor
	ln -s ${ROOT_DIR}${CURRENT_DIR}/node_modules

deploy:
	cd ${CURRENT_DIR} && zip file.zip -x "*/\.DS_Store" -@

prefix:
	curl https://gist.githubusercontent.com/bartoszmajsak/1396344/raw/bff6973325b159254a3ba13c5cb9ac8fda8e382b/prepare-commit-msg.sh > .git/hooks/prepare-commit-msg && chmod u+x .git/hooks/prepare-commit-msg

clean:
	find . -name '.DS_Store' -type f -delete
	-rm *.zip
run:
	yarn serve

install_yarn:
	yarn install

install_npm:
	npm install

lintf:
	yarn lint

fixf:
	yarn fix

############## BACK END #####################

install:
	composer install

migrate:
	php artisan migrate:fresh && \
    php artisan migrate --path=database/migrations/* && \
    php artisan db:seed && \
    php artisan passport:install

fixer:
	php-cs-fixer fix  -v --using-cache=no

idehelper:
	php artisan ide-helper:models

clear:
	composer dump-autoload && php artisan cache:clear

fixb:
	./vendor/bin/phpcbf -vvv

lintb:
	./vendor/bin/phpcs .

files:
	ls -la
