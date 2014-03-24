#!/bin/bash

cd `dirname $0`

. ../klap-utils.sh

for FILE in $(listFiles $@); do
        createExactTmpFile "account%2F[0-9a-fA-F%]+"

        isTmpFileEmpty
        if [ $? != 0 ]; then
                continue
        fi

        statHeader

        printStat "Unique Account DBs" $(wc -l $TMP_FILE)
	cat $TMP_FILE | sort | uniq -c | sort -nr | head | printTable "Most Frequent Account DBs"
done
