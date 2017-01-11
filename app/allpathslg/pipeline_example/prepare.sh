#!/bin/sh

DIR=SvAo1
LOG=prepare.sh.log

export PATH=/home/shige/bio/applications/allpathslg-52488/bin:$PATH 
#export LD_LIBRARY_PATH=/usr/local/gcc-4.7.3/lib64::$LD_LIBRARY_PATH


# ALLPATHS-LG needs 100 MB of stack space.  In 'csh' run 'limit stacksize 100000'.
ulimit -s 100000

mkdir -p $DIR/data

# NOTE: The option GENOME_SIZE is OPTIONAL. 
#       It is useful when combined with FRAG_COVERAGE and JUMP_COVERAGE 
#       to downsample data sets.
#       By itself it enables the computation of coverage in the data sets 
#       reported in the last table at the end of the preparation step. 

# NOTE: If your data is in BAM format you must specify the path to your 
#       picard tools bin directory with the option: 
#
#       PICARD_TOOLS_DIR=/your/picard/tools/bin

PrepareAllPathsInputs.pl \
 DATA_DIR=$PWD/$DIR/data \
 PLOIDY=2 \
 IN_GROUPS_CSV=in_groups.csv \
 IN_LIBS_CSV=in_libs.csv \
 GENOME_SIZE=1000000000 \
 OVERWRITE=True \
 HOSTS=4 \
 VERBOSE=2 \
 > $LOG

## Unused parameters
# FLAG_COVERAGE=120 \
# JUMP_COVERAGE=120 \
