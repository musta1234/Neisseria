#!/bin/bash

cd `dirname $0`

pod2text multiblast.pl > README.txt
pod2html multiblast.pl > README.html
git log --pretty > commit_log.txt

zip multiblast.zip multiblast.pl README.txt README.html commit_log.txt
