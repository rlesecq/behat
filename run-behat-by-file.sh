#!/bin/bash
git pull origin master
sed "s/@base_url@/$1/" $PWD/src/tests/behat.yml-dist > $PWD/src/tests/behat.yml
ant behat.test -Dbehat.feature="$2"
