#!/bin/bash
set -e -o pipefail
p="$(dirname "$0")"
t="$p/temp"
mkdir -p "$t"
dos2unix < original/isiXhosa.50000.txt.needsalignment | iconv -f iso8859-1 -t utf8 |egrep -a -v "^ *$" |egrep -a -v "^\.\.[0-9]" |./single-line.rb |sed 's/	/ /g' |./parse-num.rb |sort -n >"$t/xh-numbered.tsv"
dos2unix < original/English.50000.txt.needsalignment |sed 's/	/ /g' |./parse-num.rb |sort -n >"$t/en-numbered.tsv"
join -t "	" "$t/xh-numbered.tsv" "$t/en-numbered.tsv" >"$t/joined.tsv"
cut -f 2 "$t/joined.tsv" >"$p/navy.xh"
cut -f 3 "$t/joined.tsv" >"$p/navy.en"
