#!/bin/bash
#
# this script puts some picture files into a Pictures directory in our home directory
# it only runs commands if they need to be run and only shows necessary output
# it summarizes the Pictures directory when it is done
#

# Improve this script to also retrieve and install the files kept in the https://zonzorp.net/pics.tgz tarfile
#   - use the same kind of testing to make sure commands work and delete the local copy of the tarfile when you are done with it

# make a Pictures directory if we don't have one - assumes we have a home directory
test -d ~/Pictures || mkdir ~/Pictures

# download a zipfile of pictures to our Pictures directory if it isn't already there - assumes you are online
test -f ~/Pictures/pics.zip || wget -q -O ~/Pictures/pics.zip http://zonzorp.net/pics.zip

# test to see if the file pics.tgz is in the directory.
# if it doesn't exist then we download the file from the site.
# the file is named pics.tgz and we place it in the specified directory
test -f ~/Pictures/pics.tgz || wget -q -O ~/Pictures/pics.tgz https://zonzorp.net/pics.tgz

# unpack the downloaded zipfile if it is there, then delete the local copy of the zipfile
test -f ~/Pictures/pics.zip && unzip -d ~/Pictures -o -q ~/Pictures/pics.zip && rm ~/Pictures/pics.zip

#test to see if the file pics.tgz is present in the directory
#tar to extract a tgz file with -x for extract, z for using gzip to extract and f to target a files
#the target is ~/pics.tgz in ~/Pictures and -C to state our extraction target is ~/pictures/
#lastly if the previous command succeeded, we remove the pics.tgz file located in ~/Pictures/
test -f ~/Pictures/pics.tgz && tar -xzf ~/Pictures/pics.tgz -C ~/Pictures/ && rm ~/Pictures/pics.tgz

# Make a report on what we have in the Pictures directory
test -d ~/Pictures && cat <<EOF
Found $(find ~/Pictures -type f|wc -l) files in the Pictures directory.
The Pictures directory uses $(du -sh ~/Pictures|awk '{print $1}') space on the disk.
EOF
