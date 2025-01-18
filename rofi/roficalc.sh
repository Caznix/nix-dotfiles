#!/usr/bin/env bash

history=/tmp/history.txt

if [[ x"$@" == x"Clear" ]]; then
    rm $history ; touch $history
elif [[ x"$@" == x"" ]]; then
    :
else
    found="0"

    echo $answer
    while IFS= read -r line; do
        if [[ "$line" == "$@" ]]; then
            found="1"
            break
        fi
    done < "$history"

    if [[ $found == "1" ]]; then
        echo $@ | awk -F"[≈=]" '{ print $2 }' | wl-copy
    else
        answer=$(qalc "$@)")
        if [[ "$answer" != "" ]]; then
            echo "$(echo "$answer"; cat $history)" > $history
        fi
    fi
fi

while IFS= read -r line; do
    echo "$line"
done < "$history"


echo "Clear"

