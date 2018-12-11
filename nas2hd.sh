#!/bin/sh
#

name=`basename $0`

for dest in seagate wd; do
    if [ -d "/Volumes/$dest" ]; then
	
	echo; echo
	for dir in photos movies backup music vmbackups; do 
	    #	    cmd="rsync $* --delete --exclude *ccc* --iconv=utf-8-mac,utf-8 --exclude .Apple* --progress -avHe ssh "
	    cmd="rsync $* --delete --iconv=utf-8-mac,utf-8 --exclude .Apple* --progress -avHe ssh "

	    if [ $name == "nas2hd.sh" ]; then
		cmd=${cmd}"nas:/${dir}/ /Volumes/$dest/${dir}/"
	    else
		cmd=${cmd}"/Volumes/$dest/${dir}/ nas:/${dir}/"
	    fi
	    echo $cmd
	    $cmd

	done
    fi
done
