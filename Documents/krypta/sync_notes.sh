#! /bin/bash

cd /home/kusanagi/vimwiki/ || exit
git fetch origin master
git merge -X theirs
git add .
git commit -m "Sync @ $(date)"
git push

