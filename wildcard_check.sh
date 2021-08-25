#!/bin/bash

while read domain; do
    wordcount=$(dig @1.1.1.1 A,CNAME {test01928357434,testingforwildcard,ibetthisdoesntexist}."$domain" +short | wc -l)
    if [ $wordcount = 0 ]; then
        # If host is not wildcarded print it into a file
        echo "$domain" >> non_wildcards.txt
    fi
done < $1