#!/bin/sh
# script to help clone repos

# get all the repos listed
git clone git@github.com:movableink/resources.git

cd resources/docs

repoList=()

# filename="$1"
while read -r line
do
    name="$line"
    # echo "Name read from file - $name"
    extractedNum="${name#*:}"
    # echo $extractedNum
    extractedNum2="${extractedNum%.*}"
    # echo $extractedNum2
    repoList+=($extractedNum2)

done < "client-repos.md"

#remove resources folder
rm -rf resources/

#return to initial file path
cd ..
cd ..

repoList=("${repoList[@]:6}") #remove erroneous repos 'client' 'movableInk', etc

# if all flag passed in
if [ "$1" = "all" ] || [ "$1" = "-all" ] || [ "$1" = "--all" ]
then
	#clone all repos
	for i in "${repoList[@]}"
	do
		echo "cloning $i"
		GIT_SSH_COMMAND='ssh -i ~/.ssh/id_rsa' git clone 'git@git.movableink.com:'$i'.git'
	done
else
# clone only one repo
# print out list of repos and assign selected repo to variable repoName
	select repoName in ${repoList[@]}
	do
		echo "repo selected is $repoName"
		break
	done

# need to open the connection to your authentication agent
# clone repo into current directory
	GIT_SSH_COMMAND='ssh -i ~/.ssh/id_rsa' git clone 'git@git.movableink.com:'$repoName'.git'

fi
