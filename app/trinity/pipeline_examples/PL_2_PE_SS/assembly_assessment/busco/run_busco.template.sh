#!/bin/sh

cd $PBS_O_WORKDIR

INPUT=%FASTA%

MODE=transcriptome
# (genome | proteins | transcriptome )

LINEAGE=%LINEAGE%
## databases
#arthropoda_odb9
#bacteria_odb9
#eukaryota_odb9
#fungi_odb9
#insecta_odb9
#metazoa_odb9
#tetrapoda_odb9
#vertebrata_odb9

NCPU=%NCPU%

OUT=`basename $INPUT`_BUSCO_${LINEAGE}

BUSCO_APP_DIR=~/bio/apps/busco
BUSCO_DB_DIR=/home/DB/busco/v2

python3 $BUSCO_APP_DIR/scripts/run_BUSCO.py \
  -i $INPUT \
  -o $OUT \
  -l $BUSCO_DB_DIR/$LINEAGE \
  -m $MODE \
  -c $NCPU \




