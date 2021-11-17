#!/bin/sh -l

composer require koriym/app-state-diagram
mkdir asd-public
mv $1 asd-public/profile.xml
./vendor/bin/asd asd-public/profile.xml
