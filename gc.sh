#!/bin/sh

# query user for repo name
echo 'enter repo name (to clone - do NOT use the .git extension)'

# store user name in repoName variable
read repoName

# set up ssh to grab key for git authentication
# clone repo into current directory
GIT_SSH_COMMAND='ssh -i ~/.ssh/id_rsa' git clone 'git@git.movableink.com:'$repoName'.git'
