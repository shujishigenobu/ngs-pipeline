abundance_estimate_bowtie2_express
======

## Example

### Mapping by bowtie2

1) Edit `run_bowtie2build.sh`

2) Prepare `alignReads.conf`

If you use standard Illumina reads as inputs, `build_conf_from_leftlist.rb` is useful to build the conf file. Prepare list of R1 files and then convert the R1 flist into alignReads.conf by using the script.

3) Edit `alignReads.template.sh`

4) Generate batch job scripts using `ezjob`.

```bash
$ ruby ~/dev/ezjob/generate_jobs.rb alignReads.template.sh alignReads.conf
```

5) Submit jobs to SGE
```bash
$ qsub -v PATH run_bowtie2build.sh
...(check the job id)
$  for f in alignReads.job*sh; do qsub -v PATH -hold_jid 738995 -l nc=8 $f; done
```
### Abundance estimation by express

6) Generate batch jobs to run `express`

7) Extract count columns or RPKM columns

use `merge_express_result.rb` 

### Normalization

use `tmm_normalize.rb`

