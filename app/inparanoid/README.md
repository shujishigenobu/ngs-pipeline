# What's this?

inparanoid is developed by Dr. Sonnhammer and his collegues (Stockholm Bioinformatics Centre)

These scripts in my repository are utilities for running and post-processing inparanoid.

# Run inparanoid on cluster computers

## Overview

1) Prepare original inparanoid dir.

2) copy inparanoid dir to inparanoid_blast for example.

3) under inparanoid_blast dir, 

3-1) create inparanoid_blast.pl by patching as described below.

3-2) prepare target fasta files

```
(example)
 $ ln -s ../Maur_proteins.pep.fa Maur
 $ ln -s ../MMUSC.Mus_musculus.fas.renamed Mmus
```

4) run `build_batch_inpblast.rb`

```
ruby build_batch_inpblast.rb Mmus Maur inparanoid_blast
```

5) submit jobs for BLAST searches by runnning `sge_submission.sh`

Wait until all BLAST batch jobs are complete.

6) copy original inparanoid dir as `inparanoid_grouping`. move in `inparanoid_grouping``

7) generate the script `inparanoid_grouping.pl.patch` 

```
patch -o inparanoid_grouping.pl -u inparanoid.pl < ../inparanoid_grouping.pl.patch
```

8) make symbolic link to BLAST results in inparanoid_blast-*

9) edit `run_inparablast-grouping.sh`. and run it.



## inparanoid_blast.pl.patch

`inparanoid_blast.pl.patch` should be applied to ``inparanoid.pl`` as follows.

```bash
$ patch -o inparanoid_blast.pl inparanoid.pl < inparanoid_blast.pl.patch
```

Resultant ``inparanoid_blast.pl.patch`` is used for running BLAST only inparanoid.

```
Usage:
   inparanoid_blast.pl FASTA1
   => BLAST FASTA1
or
   inparanoid_blast.pl FASTA1 FASTA2
   => BLAST FASTA1-FASTA2  # FASTA2-FASTA1 is not calculated
```

# References

- http://inparanoid.sbc.su.se/
