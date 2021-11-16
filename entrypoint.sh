#!/bin/sh -l

composer require koriym/app-state-diagram
mkdir output
mv $1 output/$1
./vendor/bin/asd --config= output/$1
