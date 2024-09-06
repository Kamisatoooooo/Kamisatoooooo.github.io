#!/usr/bin/env bash
if [[ $1 =~ ^_drafts.* ]]
then bundle exec jekyll publish $1
else
    bundle exec jekyll publish "_drafts/$1"
fi