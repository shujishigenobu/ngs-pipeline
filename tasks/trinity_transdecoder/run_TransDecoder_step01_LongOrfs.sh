## for TransDecoder > ver. 5.0.2

#=== conf ===

#Species="Carapichea ipecacuanha"

TDDIR=~/bio/apps/TransDecoder-v5.0.2
TRANSCRIPTS=Trinity_CarIp_180309p1.fasta

MIN_LEN=50 #aa
#===

## job management system conf
## for PBS
cd $PBS_O_WORKDIR


## MAIN

echo $TRANSCRIPTS
echo $MIN_LEN


$TDDIR/TransDecoder.LongOrfs -t $TRANSCRIPTS  -m $MIN_LEN

