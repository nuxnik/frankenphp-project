#!/bin/bash

cd ../

composer create-project --prefer-dist laravel/laravel laravel
cd laravel
mv .env .env-laravel
cd ..
mv app/public app/public_org
cp -ra laravel/. app/