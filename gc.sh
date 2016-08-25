#!/bin/sh

# # array of repos from https://github.com/movableink/resources/blob/master/docs/client-repos.md, last updated 25-Aug-2016
# # list of repos found here: https://github.com/movableink/resources/blob/master/docs/client-repos.md
repoList=("ace-hardware" "adt" "american-home-shield" "amex" "amex-ctn" "amex-international" "average-joe" "basspro" "beauty-boutique" "betfair" "betsson" "bhf" "bloomingdales" "boden" "brooks" "cancer-research-uk" "capital-one" "champs" "chanel" "choice-hotels" "clarks" "columbia" "comcast" "connections-education" "crackle" "dunkin-donuts" "darden" "delta" "disneystores" "dow-jones" "eastbay" "ebay" "eharmony" "emirates" "espn" "express" "ezlinks" "fedex" "fossil" "fourseasons" "ft" "FootLocker" "fxcm" "gap" "gilt" "halfords" "hartford" "hilton" "history-channel"hipmunk "hof" "home-depot" "homedepotca" "hoteltonight" "hostelworld" "hsn" "jetblue" "joefresh" "lenovo" "macys" "matrix" "mcdonalds" "medieval-times" "mrandmrssmith" "msg" "nascar" "news-america" "nickelodeon" "nyjets" "ny-times" "nypr" "office-depot" "orbitz" "paddypower" "palace" "palace-sports" "pearle-vision" "pinnacle" "publicis" "puma" "razor-gator" "rei" "saloncentric" "screwfix" "shopdirect" "shopping-channel" "siriusxm" "skybet" "sony" "spark44" "sprint" "starbucks" "stubhub" "td" "tesco" "thepalms" "ticketmaster" "ticketmaster-uk" "ticket-liquidator" "time" "trip-advisor" "totalwine" "uber" "virgin-america" "virgin-holiday" "warby-parker" "walgreens" "western-union" "youdecide")

# if all flag passed in
if [ "$1" = "all" ]
then
#clone all repos
	for i in "${repoList[@]}"
	do
		echo "cloning $i"
		GIT_SSH_COMMAND='ssh -i ~/.ssh/id_rsa' git clone 'git@git.movableink.com:'$i'.git'
	done
else


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
