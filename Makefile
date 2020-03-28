deploy:
	cd /Users/junepc/Desktop/AMyProject/pinoybizness/pinoybiznessv2 && zip file.zip -x "*/\.DS_Store" -@

prefix:
	curl https://gist.githubusercontent.com/bartoszmajsak/1396344/raw/bff6973325b159254a3ba13c5cb9ac8fda8e382b/prepare-commit-msg.sh > .git/hooks/prepare-commit-msg && chmod u+x .git/hooks/prepare-commit-msg

clean:
	find . -name '.DS_Store' -type f -delete
	-rm *.zip
run:
	yarn serve

install:
	yarn install

install:
	npm install	

lint:
	yarn lint	

fix:
	yarn fix

############## BACK END #####################

deploy:
	cd /Users/junepc/Desktop/AMyProject/pinoybizness/pinoybiznessv2 && zip file.zip -x "*/\.DS_Store" -@

prefix:
	curl https://gist.githubusercontent.com/bartoszmajsak/1396344/raw/bff6973325b159254a3ba13c5cb9ac8fda8e382b/prepare-commit-msg.sh > .git/hooks/prepare-commit-msg && chmod u+x .git/hooks/prepare-commit-msg

clean:
	find . -name '.DS_Store' -type f -delete
	-rm *.zip

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

fix:
	./vendor/bin/phpcbf -vvv

lint:
	./vendor/bin/phpcs .