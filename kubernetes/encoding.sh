#!/bin/bash
#enter input encoding here
FROM_ENCODING="utf-16le"
#output encoding(UTF-8)
TO_ENCODING="utf-8"
#convert
CONVERT=" iconv  -f   $FROM_ENCODING  -t   $TO_ENCODING"
#loop to convert multiple files 
for  file  in  *.yaml; do
     echo $file
     file -i $file
#     iconv -f utf-16le -t utf-8 $file -o ./utf-8/$file
#     $CONVERT   "$file"   -o  "${file%.txt}.utf8.converted"
done
exit 0
