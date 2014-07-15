Illumina Read Pre-processing
============================

1) Choose template

clean_fq_ilmnTruseqPE.sh is good for standard TruSeq Illumina libraries.

2) Make a list of target read files

The list should be saved in the file `name_list.txt`.

```bash
$ \ls -1 ../Sequences/idx*gz > name_list.txt
```

3) Generate batch job scripts by running `generate_jobs_clean_fq.rb`

```
$ ruby ../ngs-pipeline/tasks/read_preprocessing/generate_jobs_clean_fq.rb
```

4) Run the batch jobs. For example, if you use SGE,

```
for f in clean_fq_job*sh; do 
    qsub -v PATH -l nc=8 $f; 
done
```

