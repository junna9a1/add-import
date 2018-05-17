#!/bin/bash
# both $1 and $2 are absolute paths
# returns $2 relative to $1
target=$(realpath $1)
search=$2


find . -name ${search} | while read -r distr; do
  dist=$(realpath ${distr})
  echo ${dist} ${target}
  relative=$(./relative.sh ${dist} ${target})
  echo $relative
  import="import colors from \"${relative}\";"
  mv ${dist} ${dist}.bak
  echo "${import}" > ${dist}
  cat "${dist}.bak" >> ${dist}
  rm ${dist}.bak
done
