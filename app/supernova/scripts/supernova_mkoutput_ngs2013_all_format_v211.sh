ASMDIR=/home/kyamaguc/work/10x/ApL_190824_maxreads208M_supernova211/outs/assembly
OUTPUT=ApL_SN190824
MIN=500

SUPERNOVA=/scratch/kyamaguc/bin/supernova-2.1.1/supernova

$SUPERNOVA \
mkoutput \
--asmdir=$ASMDIR \
--outprefix=$OUTPUT\_pseudohap2 \
--minsize=$MIN \
--style=pseudohap2 \
--index \


$SUPERNOVA \
mkoutput \
--asmdir=$ASMDIR \
--outprefix=$OUTPUT\_raw \
--minsize=$MIN \
--style=raw


$SUPERNOVA \
mkoutput \
--asmdir=$ASMDIR \
--outprefix=$OUTPUT\_megabubbles \
--minsize=$MIN \
--style=megabubbles


$SUPERNOVA \
mkoutput \
--asmdir=$ASMDIR \
--outprefix=$OUTPUT\_pseudohap \
--minsize=$MIN \
--style=pseudohap
