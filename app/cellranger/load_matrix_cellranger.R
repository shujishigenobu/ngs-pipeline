load_matrix_cellranger <- function(matrix_dir){
    barcode.path <- paste0(matrix_dir, "barcodes.tsv.gz")
    features.path <- paste0(matrix_dir, "features.tsv.gz")
    matrix.path <- paste0(matrix_dir, "matrix.mtx.gz")
    mat <- readMM(file = matrix.path)
    feature.names = read.delim(features.path, header=F, stringsAsFactors=F)
    barcode.names = read.delim(barcode.path, header=F, stringsAsFactors=F)
    colnames(mat) = barcode.names$V1
    rownames(mat) = feature.names$V1
    return(mat)
}
