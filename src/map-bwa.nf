#!/usr/bin/env nextflow

// set some default params
params.help=""

if (params.help) {
  log.info " "
  log.info "===================================================================="
  log.info "NEXTFLOW BWA PIPELINE (Version 0.1)                                 "
  log.info "===================================================================="
  log.info " "
  log.info "USAGE: "
  log.info " "
  log.info "nextflow run bwa_mem.nf \\"
  log.info " --fastq_r1 chr20.R1.fq.gz \\"
  log.info " --fastq_r2 chr20.R2.fq.gz \\"
  log.info " --genome_fasta chr20.fa \\"
  log.info " --threads 28 \\"
  log.info " --bam_prefix chr20 \\"
  log.info " --sample_name TEST \\"
  log.info " --platform ILLUMINA \\"
  log.info " --platform_unit PU1 \\"
  log.info " --library LB1 \\"
  log.info " --rundate 2017 \\"
  log.info " --outdir ./test \\"
  log.info " --outdir_tmp ./test/tmp \\"
  log.info " -with-trace -with-timeline"
  log.info " "
  log.info "HELP: nextflow run bwa_mem.nf --help"
  log.info " "
  log.info "===================================================================="
  log.info "Required Arguments:"
  log.info " "
  log.info "          --fastq_r1        STRING     FASTQ R1 FILE"
  log.info "          --fastq_r2        STRING     FASTQ R2 FILE"
  log.info "          --genome_fasta    STRING     FASTA FILE (GENOME REFERENCE)"
  log.info "          --threads         INTERGER   Number of CPUs to call"
  log.info " "
  log.info "Output and Tempory directory Arguments"
  log.info " "
  log.info "          --bam_prefix      STRING     Output BAM Filename"
  log.info "          --outdir          DIR        Output directory"
  log.info "          --outdir_tmp      DIR        Tempory directory"
  log.info " "
  log.info "SAM Read Group Arguments:"
  log.info " "
  log.info "          --rg_id           STRING     SAM Read Group Tag RG:ID (defaults to bam_prefix)"
  log.info "          --sample_name     STRING     SAM Read Group Tag RG:SM"
  log.info "          --platform        STRING     SAM Read Group Tag RG:PL"
  log.info "          --platform_unit   STRING     SAM Read Group Tag RG:PU"
  log.info "          --library         STRING     SAM Read Group Tag RG:LB"
  log.info "          --rundate         STRING     SAM Read Group Tag RG:DT"
  log.info ""
  log.info "===================================================================="
  log.info "Optional Pipeline Arguments:"
  log.info "===================================================================="
  log.info " "
  log.info "Optional BWA Alignment Arguments:"
  log.info " "
  log.info "          --bwa_args        STRING     Optional bwa arguments eg: \"-I 250,50\""
  log.info " "
  log.info "===================================================================="
  exit 1

}

/*
 * Defines some parameters in order to specify the reference genomes
 * read pairs, threads and output by using the command line options
 */

//number of threads
params.threads = 28

//genome version
params.genome_fasta = "/mnt/data2/ngs_projects/raw_fastq/ngs_nextflow/test/chr20.fa"

//sample information
params.fastq_r1 = "/mnt/data2/ngs_projects/raw_fastq/ngs_nextflow/test/chr20.R1.fq.gz"
params.fastq_r2 = "/mnt/data2/ngs_projects/raw_fastq/ngs_nextflow/test/chr20.R2.fq.gz"
params.bam_prefix = "chr20"
params.rg_id = "${params.bam_prefix}"
params.sample_name="NA12878"
params.platform="ILLUMINA"
params.platform_unit="PU1"
params.library="LB1"
params.rundate=""

//bwa args
params.bwa_args=""

//output and tempory directories
params.outdir = "/mnt/data2/ngs_projects/raw_fastq/alignments"
params.outdir_tmp = "/mnt/data2/ngs_projects/raw_fastq/alignments/tmp"

/*
 * fastq R1 and R2 files
 */

fastq1 = file(params.fastq_r1)
fastq2 = file(params.fastq_r2)

/*
 * log.info
 */
log.info "===================================================================="
log.info "BWA MEM PIPELINE : Map, mark duplicates, sort and index             "
log.info "===================================================================="
log.info "ref genome         : ${params.genome_fasta}"
log.info "Fastq R1           : ${params.fastq_r1}"
log.info "Fastq R2           : ${params.fastq_r2}"
log.info "RG:SM              : ${params.sample_name}"
log.info "RG:PL              : ${params.platform}"
log.info "RG:PU              : ${params.platform_unit}"
log.info "RG:LB              : ${params.library}"
log.info "RG:ID              : ${params.rg_id}"
log.info "RG:DT              : ${params.rundate}"
log.info "bam_prefix         : ${params.bam_prefix}"
log.info "outdir             : ${params.outdir}"
log.info "temp_dir           : ${params.outdir_tmp}"
log.info "threads            : ${params.threads}"
log.info "BWA                : ${params.bwa_args}"

/*
 * Step 1.0 : bwa alignment: samblaster and sambamba
 * https://github.com/nextflow-io/faq
 */

process bwa_mem {
  echo true
  tag { params.bam_prefix }
  cpus params.threads
  publishDir params.outdir,  mode: 'copy', overwrite: false

  input:
    file fastq1
    file fastq2

  output:
    file '*.dupemk.bam' into dupemk_bam, dupemk_bam_to_index, dupemk_bam_for_flagstat, dupemk_bam_for_idxstats
    file '*.err' into error_file
    file '*.bai' into bam_index

"""
bwa mem \
-M \
${params.bwa_args} \
-t ${task.cpus} \
-R '@RG\tID:${params.rg_id}\tSM:${params.sample_name}\tPU:${params.platform_unit}\tPL:${params.platform}\tLB:${params.library}\tDT:${params.rundate}' \
$params.genome_fasta \
$fastq1 $fastq2 | \
samblaster \
--addMateTags \
--excludeDups | \
sambamba view -t ${task.cpus} -S -f bam /dev/stdin | \
sambamba sort -t ${task.cpus} -m 8GB \
--tmpdir=${params.outdir_tmp} \
-o ${params.bam_prefix}.dupemk.bam /dev/stdin 2>${params.bam_prefix}.bwa_mem.err;
#
sambamba index --nthreads=${task.cpus} ${params.bam_prefix}.dupemk.bam
"""
}

//ALIGNMENT STATS

	/*
	* Step 1.2 flagstats
	*/

	process sambamba_flagstat {
	  echo true
	  tag { params.bam_prefix }
	  cpus params.threads
	  publishDir params.outdir,  mode: 'copy', overwrite: false

	  input:
	    file bam_to_flagstat from dupemk_bam_for_flagstat

	  output:
	    file '*.flagstat.txt' into flagstat_file

	"""
	sambamba flagstat -t ${task.cpus} $bam_to_flagstat > ${params.bam_prefix}.dupemk.bam.flagstat.txt
	"""
	}

	/*
	 * Step 1.3 samtools idxstat
	 */

	process samtools_idxstat {
	  echo true
	  tag { params.bam_prefix }
	  cpus params.threads
	  publishDir params.outdir,  mode: 'copy', overwrite: false

	  input:
	    file bam_to_idxstat from dupemk_bam_for_idxstats
      file bai from bam_index

	  output:
	    file '*.idxstat.txt' into idxstat_file

	"""
	samtools idxstats $bam_to_idxstat > ${params.bam_prefix}.dupemk.bam.idxstat.txt
	"""
	}

//fini
workflow.onComplete {
	println ( workflow.success ? "Done!" : "Oops .. something went wrong" )
}