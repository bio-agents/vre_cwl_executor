cwlVersion: v1.0
class: Workflow

requirements:
  - class: ScatterFeatureRequirement
  - class: MultipleInputFeatureRequirement
  - class: SubworkflowFeatureRequirement

inputs:
  input_reads: File
  biospecimen_name: string
  indexed_reference_fasta: File

outputs:
  bam_files: {type: 'File[]', outputSource: samagents_split/bam_files}

steps:
  samagents_split:
    run: samagents_split.cwl
    in:
      input_bam: input_reads
      reference: indexed_reference_fasta
    out: [bam_files]
