#!/bin/bash

# this function will find the files with the defined extensions and copy them into 
# the actual directory
function collect() {
  OLD_IFS=$IFS
  IFS=$'\n'
  files=( $( 
    find /d/DEV -type f \( -iname \*.docx -o -iname \*.mobi -o -iname \*.doc -o -iname \*.pdf \) \
      -not \( -path  '*/.git/*' -o -path '*/.m2/*' -o -path '*/caches/*' -o -path '*/.svn/*' \) 2>/dev/null
    ))
  for i in ${files[*]} ; do
    cp -v $i .
  done
  IFS=$OLD_IFS
}
