#!/bin/bash
#Author: Edson Angelo Carara (edson.carara@gmail.com)
#Date: 16-may-2020
#Propose: Logs, in csv format, internet speed along the day
#Dependcy: speedtest cli
#          see https://www.speedtest.net/pt/apps/cli
#Copyleft GNU GPL 3 License
#https://www.gnu.org/licenses/quick-guide-gplv3.html

THIS=$(basename $0)
VERSION=0.1

bin="speedtest"
test_exists_bin=`command -v $bin`

function help() {
   echo -e "Author: Edson Angelo Carara <edson.carara@gmail.com>"
   echo "CopyLeft GNU GPL 3"
   echo "$THIS $VERSION
   -l <log path>
   -h (show this help)"

   exit -1
}

#gets the parameters
while getopts "hl:" opt
do
   case $opt in
      "h") help;;
      "l") log_path=$OPTARG ;;
      "?") help;;
   esac
done

if [ -z "$log_path" ]
then
   log_path=`pwd`
fi

log_file="$log_path/speedtest-`date +"%Y-%m-%d"`.txt"

if [ -z "$test_exists_bin" ]
then
   echo "$bin not found in path [$PATH]"
   exit 1
fi

if [ ! -d $log_path ]
then
   error=$(mkdir -p $log_path 2>&1)
   if [ ! -z "$error" ]
   then
      echo $error
      exit -2
   fi
fi

if [ ! -f $log_file ]
then
   $bin --csv-header > $log_file
fi

$bin --csv >> $log_file
