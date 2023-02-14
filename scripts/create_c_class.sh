#!/bin/bash

REPO=linux-settings
RES=res
FILE_H=class.h
FILE_C=class.c

SRC_DIR=src
HEAD_DIR=include
CLASS_DIR=

func()
{
	local name_uppercamlecase=$1
	local name_lowercase=$(echo $1 | tr '[:upper:]' '[:lower:]')
	local name_upcase=$(echo $1 | perl -ne 'print lc(join("_", split(/(?=[A-Z])/)))' | tr '[:lower:]' '[:upper:]')

	CLASS_DIR=$SRC_DIR/$name_lowercase
	mkdir -p $HEAD_DIR
	mkdir -p $SRC_DIR
	mkdir -p $CLASS_DIR

	cat $HOME/$REPO/$RES/$FILE_H | sed -e "s/REPLACE/$name_upcase/g" | sed -e "s/Replace/$name_uppercamlecase/g" > ./$HEAD_DIR/$name_uppercamlecase.h
	cat $HOME/$REPO/$RES/$FILE_C | sed -e "s/Replace/$name_uppercamlecase/g" > ./$CLASS_DIR/$name_uppercamlecase.c
}

func $1
