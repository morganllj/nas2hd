#!/bin/sh
#

# while getopts "rh: opt; do
#   case "$opt" in
  
# done


#cmd="rsync3 00cmdline00 --iconv=utf-8-mac,utf-8 --exclude .Apple* --progress --delete -avHe ssh nas:/00dir00/ /Volumes/00dest00/00dir00"
# cmd="rsync3 00cmdline00 --iconv=utf-8-mac,utf-8 --exclude .Apple* --progress --delete -avHe ssh"
# if [ $1 == "-r" ]; then
# else

name=`basename $0`

for dest in seagate wd; do
#echo; echo
#for dest in $dests; do
    if [ -d "/Volumes/$dest" ]; then
	
	echo; echo
#	for dir in photos movies backup vmbackups; do
	for dir in photos movies backup vmbackups; do 
	    #	for dir in vmbackups; do 
	    # echo; echo ${dir}...
	    # run_cmd=`echo $cmd|sed "s/00cmdline00/$*/" | sed "s/00dir00/$dir/g" | sed "s/00dest00/$dest/g"`
	    # echo $run_cmd
            # $run_cmd

	    #    rsync3 $* --iconv=utf-8-mac,utf-8 --exclude .Apple* --progress --delete -avHe ssh nas:/${dir}/ /Volumes/seagate\ horizontal/${dir}; 
	    #    $cmd


	    # cmd="rsync $* --iconv=utf-8-mac,utf-8 --exclude .Apple* --progress --delete -avHe ssh nas:/${dir}/ /Volumes/$dest/${dir}"
	    #	    cmd="rsync $* --iconv=utf-8-mac,utf-8 --exclude .Apple* --progress --delete -avHe ssh "
	    cmd="rsync $* --delete --exclude *ccc* --iconv=utf-8-mac,utf-8 --exclude .Apple* --progress -avHe ssh "


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
