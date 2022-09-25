#!/usr/bin/env bash
service supervisor start
supervisorctl reread
supervisorctl update
service nginx start
service nginx restart
#php-fpm
