#!/bin/bash


rake db:migrate
rake db:seed

cd cold_callr-ember
npm install ember-cli -g
npm install
bower install

echo "attempt to run the ember tests with 'ember test'"
echo "run the ember serve with 'ember serve --proxy=http://localhost:3000'"
