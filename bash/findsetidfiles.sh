#!/bin/bash
#
# this script generates a report of the files on the system that have the setuid permission bit turned on
# it is for the lab1 exercise

# Task 1 for the exercise is to modify it to also find and display the setgid files in a second listing
# The second listing should display after the setuid file list, and be formatted similar to the setuid file list

# Task 2 for the exercise is to modify it to also display the 10 largest files in the system, sorted by their sizes
# The listing should include the file name, owner, and size in MBytes and be displayed after the listings of setuid and setgid files

echo "Setuid files:"
echo "============="
find / -type f -executable -perm -4000 -ls 2>/dev/null | sort -k 3

#Same format as first command, find with / indicating start at root, -type f to search only for files and -perm for permissions,
#the 2000 searches for special permissions on files in the group set, with 4000 being special permissions for owner set and 6000 would search only for ones with for both
#the -ls 2>/dev/null says to take all responses with exit code 2 (in this case for invalid permissions) and sent to /dev/null which discards the text
#lastly the output is piped into sort with -k 3 sorting it by the 3rd key which means the owner name
echo "setgid files"
echo "============="
find / -type f -executable -perm -2000 -ls 2>/dev/null | sort -k 3

#ls to list all files and directories. -lh for long list and human readable values (g,m,k) and capital S to sort by file sizes
#the output is piped into head -11 to show the first 11 lines and piped into tail -10 for only last 10 lines
#(There's probably a better way to get rid of the one line that shows total storage of all files, but that's the best i came up with)
echo "10 largest files on system"
echo "============="
ls -lhS / | head -11 | tail -10
