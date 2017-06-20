#!/bin/sh

for i in delay-one-run/*/*.txt; do
    grep '^entries' "$i" | sed 's/^entries *= *//' | sed 's/ /\n/g' > "$i".dat
done
