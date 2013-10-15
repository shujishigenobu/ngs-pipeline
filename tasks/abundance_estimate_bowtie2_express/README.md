abundance_estimate_bowtie2_express
======

## Example

1) Prepare `alignReads.conf`

2) Edit `build_conf_from_leftlist.rb` and `alignReads.template.sh`

3) Generate batch job scripts using `ezjob`.

```bash
$ ruby ~/dev/ezjob/generate_jobs.rb alignReads.template.sh alignReads.conf
```

4) Submit jobs to SGE
```bash
$ qsub -v PATH run_bowtie2build.sh
...(check the job id)
$  for f in alignReads.job*sh; do qsub -v PATH -hold_jid 738995 -l nc=8 $f; done
```
