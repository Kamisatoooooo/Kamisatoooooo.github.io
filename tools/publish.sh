#!/usr/bin/env bash
if [[ $# -eq 0 ]]
then
    exit 0
fi

if [[ $1 =~ ^_drafts.* ]]
then bundle exec jekyll publish "$1"
else
    bundle exec jekyll publish "_drafts/$1"
fi
