#! /bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

timeTree=$1 # (true) tree with branch lengths in time unit
subsTree=$2 # (true) tree with branch lengths in substitution unit
sampleSize=$3 # size of each sample; 1 outgroup will be added
nreps=$4 # number of replicates
outputDir=$5 # where to output the files

echo $outputDir

#$DIR/create_replicates.sh $timeTree $subsTree $sampleSize $nreps $outputDir true
#$DIR/run_lsd.sh $outputDir $nreps true
$DIR/run_logDating.sh $outputDir $nreps true
