#! /bin/bash

[[ $_ != $0 ]] && REALPATH=`dirname $(readlink -f ${BASH_SOURCE[0]})` || REALPATH=`dirname $(readlink -f $0)`
export PATH="$REALPATH/bin:$PATH"

