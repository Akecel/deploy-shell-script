!#/bin/bash
cd /srv/src/simple_test_repo
git pull
rsync -r . /var/www/html --exclude .git
