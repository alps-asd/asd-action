#!/bin/sh -l

composer require koriym/app-state-diagram
mkdir asd-public
mv $1 asd-public/$1
./vendor/bin/asd --config= asd-public/$1
