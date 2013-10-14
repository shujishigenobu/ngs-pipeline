
## How to run?

1) Prepare original inparanoid dir.

2) copy inparanoid dir to inparanoid_blast for example.

3) under inparanoid_blast dir, 

3-1) create inparanoid_blast.pl by patching as described below.

3-2) prepare target fasta files

4) run `build_batch_inpblast.rb`

5) submit jobs to sge by runnning `sge_submission.sh`

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
