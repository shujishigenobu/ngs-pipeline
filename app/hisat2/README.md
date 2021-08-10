## hisat2_alignment_summary_to_json.rb

```
Usage:
ruby hisat2_alignment_summary_to_json.rb HISAT2_REPORT
```

(examples)

```
ruby hisat2_alignment_summary_to_json.rb HISAT2_REPORT  \
|jq -r '. | [.report_file, .total_num_read_pairs, .percent_overall_alignment] |@tsv'
```