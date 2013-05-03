#!/bin/bash -x
COOK_DIR="$( readlink -f -- "${0%/*}" )/../"
KITCHEN_DIR="${COOK_DIR}/.kitchen"
cd $COOK_DIR

export GEM_HOME="${HOME}/.gem"
export PATH="${HOME}/.gem/bin:$PATH"
export VAGRANT_HOME="${HOME}/.vagrant_cookbooks"

if [ ! -f $KITCHEN_DIR/prepared ]
then
    gem install kitchen-vagrant || exit 1
    gem install test-kitchen --pre || exit 1
    mkdir -p $KITCHEN_DIR
    touch $KITCHEN_DIR/prepared
fi

foodcritic  . || exit 1
knife cookbook test -o .. $(basename $PWD) || exit 1
kitchen test
