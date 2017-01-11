#!/bin/sh

#$ -S /bin/bash
#$ -l nc=24
#$ -cwd

export PATH=/home/shige/bio/applications/allpathslg-52488/bin:$PATH
#export PATH=/home/shige/bio/applications_ngs2013/allpathslg-52488/bin:$PATH

#export LD_LIBRARY_PATH=/usr/local/gcc-4.7.3/lib64::$LD_LIBRARY_PATH
#  it is required in running on ngs2013 server because the software was compiled using 
#  a new gcc located in this path.

REF=SvAo1
LOG=assemble.sh.log
NCPU=24

ulimit -s 100000

RunAllPathsLG \
 PRE=$PWD \
 REFERENCE_NAME=$REF \
 DATA_SUBDIR=data \
 RUN=run \
 OVERWRITE=True \
 VAPI_WARN_ONLY=True \
 HAPLOIDIFY=False \
 THREADS=$NCPU \
 > $LOG

