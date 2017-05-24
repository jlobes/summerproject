#!/bin/bash
if [ -d "canonfodder" ]; then
  rm -rf canonfodder
fi
mkdir canonfodder
cd canonfodder
declare -a arr=("git@github.com:canonfodder/viz.git" "git@github.com:canonfodder/db-ops.git" "git@github.com:canonfodder/corpus-ops.git" "git@github.com:canonfodder/data.git")
for i in "${arr[@]}"
do
   git clone "$i"
done
cd db-ops
ipython db_ops_alchemy.py
cd ..
bokeh serve viz