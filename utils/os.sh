#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  echo "osx"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  echo "linux"
fi
