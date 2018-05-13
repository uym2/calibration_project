#! /bin/bash

wdir=$1
nreps=$2
jobID=$3

for i in $(seq 1 $nreps); do
    d=$wdir/rep$(printf "%02d" $i)
    lsd -i $d/$jobID.subs.tre -a 0 -z `nw_distance $d/$jobID.time.tre | head -n1` -v -c
    nw_distance -n -mr -si $d/$jobID.subs.tre.result.date.newick | sort -n > $d/$jobID.lsd.nodeAge.txt
    echo "sqrt(`paste $d/$jobID.nodeAge.txt $d/$jobID.lsd.nodeAge.txt | awk '{print ($4-$2)*($4-$2);}' | numlist -avg`)" | bc > $d/lsd.nodeAge_rmse.txt
done    
