#!/bin/sh -l

composer require koriym/app-state-diagram
mkdir asd-public
mv $2 asd-public/$(basename $2)
./vendor/bin/asd --config=$1 asd-public/$(basename $2)
