
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
