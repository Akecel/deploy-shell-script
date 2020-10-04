!#/bin/bash
cd /srv/src/simple_test_repo
rsync -r . /var/www/html --exclude .git
