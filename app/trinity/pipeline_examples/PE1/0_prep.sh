MY_NGS_PIPELINE=~/MyGitHub/ngs-pipeline

mkdir Reads_SRA
mkdir Reads_fastq
mkdir Reads_cleaned
mkdir script_templ

cp $MY_NGS_PIPELINE/tasks/read_preprocessing/run_cutadapt.PE.template.sh ./script_templ
cp $MY_NGS_PIPELINE/tasks/read_preprocessing/clean_fq_TruSeq_SE_template.sh ./script_templ
cp $MY_NGS_PIPELINE/app/trinity/templates/run_trinity_PE_v2.1.1_template.sh ./script_templ
cp $MY_NGS_PIPELINE/app/trinity/templates/run_trinity_SE_template.sh ./script_templ
cp $MY_NGS_PIPELINE/util/generate_jobs.rb ./script_templ
cp $MY_NGS_PIPELINE/app/sra/sra_to_fastq.sh ./script_templ


## After completing the commands above,
## Manual preparation required as follwoing:
##
## 1) populate Reads_SRA


