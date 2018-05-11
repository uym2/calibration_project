timeTree=$1 # (true) tree with branch lengths in time unit
subsTree=$2 # (true) tree with branch lengths in substitution unit
sampleSize=$3 # size of each sample; 1 outgroup will be added
nreps=$4 # number of replicates
outputDir=$5 # where to output the files
jobID=$6

[ -d $outputDir ] || mkdir $outputDir

for i in $(seq 1 $nreps); do
    d=$outputDir/rep$(printf "%02d" $i)
    mkdir $d
    sample_with_outgroups.py -t $timeTree -i $sampleSize -o 1 -r 1 -e $d/$jobID.time.tre -f $d/$jobID.info
    taxonList=`grep "Ingroups\|Outgroups" $d/$jobID.info | sed -e "s/Ingroups: //g" -e "s/Outgroups: //g"` 
    prune_tree.py -i $subsTree -o $d/$jobID.subs.tre -v -l "$taxonList"
done
