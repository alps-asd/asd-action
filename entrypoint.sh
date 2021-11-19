#!/bin/sh -l

composer require koriym/app-state-diagram
dirname=$(dirname $2)
./vendor/bin/asd --config=$1 $2
echo "::set-output name=latest_output_dir::$dirname"
