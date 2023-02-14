#!/bin/bash

REPO=linux-settings
RES=res
FILE_INIT=init_utest.t.c
FILE_C=utest.t.c

SRC_DIR=unit_test
HEAD_DIR=unit_test/include
CLASS_DIR=

search_replace_file()
{
	local file=$1
	local mark=$2
	local txt=$3

	local cmd="s/$mark/$txt/g"
	echo cmd
	echo $cmd
	local tmp=/tmp/utest_tmp_swap
	cp $file $tmp 
	cat $tmp | sed -e "$cmd" > $file
	rm $tmp
}

init_header()
{
	local name_lowercase=$1
	local global_declaration=g_"$name_lowercase"_tests
	local func_declaration=test_"$name_lowercase"_create_destroy

	local file=./$HEAD_DIR/unit_test.h

	local mark="\#endif"
	local txt="\/\/ $name_lowercase\nvoid\t$func_declaration(void);\n\n#endif"
	search_replace_file $file "$mark" "$txt"

	mark="g_suites\[\];"
	txt="$mark\nextern CU_TestInfo\t$global_declaration[];"
	search_replace_file $file "$mark" "$txt"
}

init_suit()
{
	local name_lowercase=$1
	local file=./$SRC_DIR/main/init_suites.t.c
	local mark="\tCU_SUITE_INFO_NULL"
	local txt="{\n\t\"$1\",\n\tinit_suite,\n\tclean_suite,\n\tNULL,\n\tNULL,\n\tg_$1_tests,\n},\n\tCU_SUITE_INFO_NULL"
	search_replace_file $file "$mark" "$txt"
}

func()
{
	local name_uppercamlecase=$1
	local name_lowercase=$(echo $1 | tr '[:upper:]' '[:lower:]')
	local name_upcase=$(echo $1 | perl -ne 'print lc(join("_", split(/(?=[A-Z])/)))' | tr '[:lower:]' '[:upper:]')

	CLASS_DIR=$SRC_DIR/$name_lowercase
	mkdir -p $HEAD_DIR
	mkdir -p $SRC_DIR
	mkdir -p $CLASS_DIR

	cat $HOME/$REPO/$RES/$FILE_C | sed -e "s/Replace/$name_lowercase/g" > ./$CLASS_DIR/$name_lowercase.t.c
	cat $HOME/$REPO/$RES/$FILE_INIT | sed -e "s/Replace/$name_lowercase/g" > ./$CLASS_DIR/init_$name_lowercase.t.c

	init_header $name_lowercase
	init_suit $name_lowercase
}

func $1
