library(edgeR)

outfile = "%OUTPUT_FILE%"
rnaseqMatrix = read.delim("%INPUT_FILE%", header=F, row.names=1, comment.char="#")
colnames(rnaseqMatrix) = %COLS%
rnaseqMatrix = round(rnaseqMatrix)
exp_study = DGEList(counts=rnaseqMatrix, group=factor(colnames(rnaseqMatrix)))
exp_study = calcNormFactors(exp_study, method="TMM")
cpm.tmm <- cpm(exp_study, normalized.lib.sizes=T)
write.table(cpm.tmm, file=outfile, sep="\t", quote=F)
write.table(exp_study$samples, file="expr_est_count.txt.TMM_info.txt", quote=F, sep="\t", row.names=F)
