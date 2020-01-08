#!/bin/bash
flag=false
for f in $(ls); do
    while read line; do
        if [[ $line == '' ]] 
        then
            continue
        fi
        if [[ $line == 'ILOSC' ]]
        then
            flag=true
            continue
        fi
        if [[ $flag == false ]]
        then
            echo $line | sed 's/,/./g' >> $f.out
        else
            echo $line | sed 's/,/./g' >> $f.out2
        fi
    done <$f
    flag=false
done
