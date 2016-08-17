#!/bin/sh

# query user for repo name
echo 'enter repo name (to clone)'

# store user name in repoName variable
read repoName

# clone repo into current directory
# this works a particular user, in the example case cdersky
git clone 'git@github.com:cdersky/'$repoName'.git'
