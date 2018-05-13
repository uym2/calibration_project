#! /bin/bash

wdir=$1
nreps=$2
jobID=$3

for i in $(seq 1 $nreps); do
    d=$wdir/rep$(printf "%02d" $i)
    echo $d
    date_tree.py -i $d/$jobID.subs.tre -s $d/$jobID.samplingTime.txt -r 0 -t $d/$jobID.subs.time_logDate.tre
    nw_distance -n -mr -si $d/$jobID.subs.time_logDate.tre | sort -n > $d/$jobID.logDate.nodeAge.txt
    echo "sqrt(`paste $d/$jobID.nodeAge.txt $d/$jobID.logDate.nodeAge.txt | awk '{print ($4-$2)*($4-$2);}' | numlist -avg`)" | bc > $d/logDate.nodeAge_rmse.txt
    cat $d/logDate.nodeAge_rmse.txt
done    
