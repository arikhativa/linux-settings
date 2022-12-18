#!/bin/bash

REPO=linux-settings
RES=res
FILE_H=class.hpp
FILE_C=class.cpp

create_cpp_class()
{
	local name_uppercamlecase=$1
	local name_lowercase=$(echo $1 | tr '[:upper:]' '[:lower:]')
	local name_upcase=$(echo $1 | tr '[:lower:]' '[:upper:]')

	cat $HOME/$REPO/$RES/$FILE_H | sed -e "s/REPLACE/$name_upcase/g" | sed -e "s/Replace/$name_uppercamlecase/g" > ./$name_uppercamlecase.hpp
	cat $HOME/$REPO/$RES/$FILE_C | sed -e "s/Replace/$name_uppercamlecase/g" > ./$name_uppercamlecase.cpp
}

create_cpp_class $1
