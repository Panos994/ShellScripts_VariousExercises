1st exercise: Create a shell script that prints your computer's active TCP network connections and the current date/time and stores them in a file named ~/.tcp_connections. To see the active connections one can use the netstat command or ss

#!/bin/bash

echo -e "$(date)\t tcp_connection: $(ss -t -H -O | wc -l)" >>
~/.tcp_connections
echo -e "$(date)\t tcp_connection: $(ss -t -H -O | wc -l)";



2nd exercise:Create a shell script that takes a directory as an argument and displays information about the type of files in the directory aggregated and sorted so that the most common file types are displayed first


#!/bin/bash

for i in $(ls -p $1 | grep -v /)
do
file $i | awk -F : '{print $2}';
done | uniq -c | sort -nr


3rd exercise: Create a shell script that takes as arguments an array of numbers and the array and sorts them in ascending or descending order.
Be sure to do the necessary checks to ensure that numbers are given as arguments (after the 1st argument).

!/bin/bash
A1 = $1

if [ $# -gt 2 ]
echo "2 arguments needed"
then
i=1;
j=$(($#-1));
shift 1;
while [ $i -le $j ]
do

if [ -z "$(echo $1 | grep -E "^[0-9]+$")" ];
then
echo "$1" >> unsort_int
fi
i=$((i++))
shift 1;
done

case $A1 in
incr)
sort -n unsorted_int
;;

sort -nr unsorted_int
;;
*)
echo "error"
;;
esac
else
echo "Should complete the number of arguments"
fi



4rth exercise: You are given a log file from an apache web server.

You can download it as follows:

curl https://gitlab.com/atsadimas/operating-systems/-/raw/master/exercises/basic-commands/apache.log.txt -o apache.log.txt

4.1 Show the 10 most visited ips and their count

#!/bin/bash

awk '{ print $1}' apache.log.txt.1 | sort | uniq -c | sort -nr | head -n 10

4.2 Show the 20 most popular urls (http request and requested path) and their count 

HTTP METHODS

    GET
    POST
    HEAD
    POST
    PUT
    DELETE
    CONNECT
    OPTIONS
    TRACE
    
 #!/bin/bash

awk -F "\"" '{print$2}' apache.log.txt.1 | awk -F " " '{print$1" "$2}' |
grep --color=never -E "POST|GET" | sort | uniq -c | sort -rn | head --l 20;


4.3 For the IPs of query 4.1 display the country by calling a geolocation api like https://ipapi.co/api/?shell#introduction

#!/bin/bash

for i in $(./it2021154_ex_5_1.sh | awk -F " " '{print $2}')
do
echo -en "$i ->";
curl https://ipapi.co/$i/country/;
echo ;
done


