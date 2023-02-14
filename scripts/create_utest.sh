#!/bin/bash

REPO=linux-settings
RES=res
FILE_INIT=init_utest.t.c
FILE_C=utest.t.c

SRC_DIR=unit_test
HEAD_DIR=unit_test/include
CLASS_DIR=

func()
{
	local name_uppercamlecase=$1
	local func_declaration=test_$1_create_destroy
	local name_lowercase=$(echo $1 | tr '[:upper:]' '[:lower:]')
	local name_upcase=$(echo $1 | perl -ne 'print lc(join("_", split(/(?=[A-Z])/)))' | tr '[:lower:]' '[:upper:]')

	CLASS_DIR=$SRC_DIR/$name_lowercase
	mkdir -p $HEAD_DIR
	mkdir -p $SRC_DIR
	mkdir -p $CLASS_DIR

	cat $HOME/$REPO/$RES/$FILE_C | sed -e "s/Replace/$name_lowercase/g" > ./$CLASS_DIR/$name_lowercase.t.c
	cat $HOME/$REPO/$RES/$FILE_INIT | sed -e "s/Replace/$name_lowercase/g" > ./$CLASS_DIR/init_$name_lowercase.t.c

	TMP_H=/tmp/unit_test.h
	CUR_H=./$HEAD_DIR/unit_test.h
	TXT="\/\/ $name_lowercase\nvoid\t$func_declaration(void);\n\n#endif\n"
	CMD=$(echo "s/\#endif/$TXT/g")
	cp $CUR_H $TMP_H | cat $TMP_H | sed -e "$CMD" > $CUR_H.h
	rm $TMP_H
}

func $1
