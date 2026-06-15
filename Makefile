.PHONY: deploy
deploy:
	@hugo
	@rsync -avz --delete -e "ssh -i ~/.ssh/id_ed25519_jtyocum" public/ jtyocum@nbg01.publicmx.com:/srv/www/vhosts/publicmx.com/html/

.PHONY: test
test:
	@hugo server

.PHONY: clean
clean:
	@rm -rf public/
