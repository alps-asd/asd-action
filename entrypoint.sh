#!/bin/sh -l

composer require koriym/app-state-diagram
dirname=$(dirname $2)
./vendor/bin/asd --config=$1 $2
/usr/bin/php hoge.php
if [ $? -ne "0" ]; then
  echo "ASD error"
  exit 1
else
  echo "Output Directory: $dirname"
  echo "::set-output name=dir::$dirname"
fi
