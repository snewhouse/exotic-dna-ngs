#!/usr/bin/env bash

# A selection of scripts

# get_broad_genomes function
get_broad_genomes(){
	#--------------------------------------------------#
	# args
	readonly VERSION="v0.1-08.17"
    readonly PROGNAME=$(basename $0)
    readonly PROGDIR=$(readlink -m $(dirname $0))
    readonly ARGS="$@"
    local ECHO_BASE="[`date`][${PROGNAME}:${VERSION}]"

    #--------------------------------------------------#
    # wget commands
    readonly WGET_DIRS="wget -r -nH --no-parent --reject "index.html*" -e robots=off"
    readonly WGET_FILE="wget -nc -e robots=off"

	#--------------------------------------------------#
	# usage
	local USAGE="get_broad_genomes <b38|b37|b37d|hg19> <fasta|bundle> </PATH/TO/GENOME/DIR>}"

	# test if arg present
	if [[ $# -eq 0 ]]; then
	    echo "${ECHO_BASE} [   ERROR]: No arguments supplied"
	    echo "${ECHO_BASE} [   USAGE]: ${USAGE}"
	    exit 1
	else
	    echo "${ECHO_BASE} [    INFO]: ${ARGS}"
	fi

	#--------------------------------------------------#
	# set reference genome to get
	local GENOME=${1:-"b38"} # default b38

	# set fasta or bundle
	local BUNDLE=${2:-"fasta"} # default fasta only

	# set download directory
    local GENOME_DIR=${3:-"/home/${user}/data/genomes/human"}


    #--------------------------------------------------#
    # reference genome fasta files ftp address
    local b37_broad_fasta="ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/human_g1k_v37.fasta.gz"
    local b37_decoy_broad_fasta="ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/human_g1k_v37_decoy.fasta.gz"
    local b38_broad_fasta="ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/hg38/Homo_sapiens_assembly38.fasta.gz"
    local hg19_broad_fasta="ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/hg19/ucsc.hg19.fasta.gz"

    # broad gatk bundle ftp address
    local b37_broad_bundle="ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/"
    local b37_decoy_broad_bundle="ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/"
    local b38_broad_bundle="ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/hg38/"
    local hg19_broad_bundle="ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/hg19/"

    #--------------------------------------------------#
    # make dir if needed
	if [[ ! -d "${GENOME_DIR}" ]]; then
        echo "Can't find ${GENOME_DIR}"
        echo "Creating ${GENOME_DIR}"
        local CMD0="mkdir -p ${GENOME_DIR}"
        ${CMD0}
    elif
    else
    fi

    #--------------------------------------------------#
    # message
    local WGET_MESSAGE="Downloading ${GENOME} ${BUNDLE} to ${GENOME_DIR}"

    #--------------------------------------------------#
    # get fastas
    if [[ "${GENOME}" == "b37" && "${BUNDLE}" == "fasta" ]]; then
        local URL=${b37_broad_fasta}
        local FASTA="${GENOME_DIR}/human.${GENOME}.fasta.gz"
        local CMD0="${WGET_FILE} -O ${FASTA} ${URL}"
        cd ${GENOME_DIR}
        echo ${WGET_MESSAGE}
        ${CMD0}
    elif [[ "${GENOME}" == "b38" && "${BUNDLE}" == "fasta" ]]; then
        local URL=${b38_broad_fasta}
        local FASTA="${GENOME_DIR}/human.${GENOME}.fasta.gz"
        local CMD0="${WGET_FILE} -O ${FASTA} ${URL}"
        cd ${GENOME_DIR}
        echo ${WGET_MESSAGE}
        ${CMD0}
    elif [[ "${GENOME}" == "b37d" && "${BUNDLE}" == "fasta" ]]; then
        local URL=${b37_decoy_broad_fasta}
        local FASTA="${GENOME_DIR}/human.${GENOME}_decoy.fasta.gz"
        local CMD0="${WGET_FILE} -O ${FASTA} ${URL}"
        cd ${GENOME_DIR}
        echo ${WGET_MESSAGE}
        ${CMD0}
    elif [[ "${GENOME}" == "hg19" && "${BUNDLE}" == "fasta" ]]; then
        local URL=${hg19_broad_fasta}
        local FASTA="${GENOME_DIR}/human.ucsc.${GENOME}.fasta.gz"
        local CMD0="${WGET_FILE} -O ${FASTA} ${URL}"
        cd ${GENOME_DIR}
        echo ${WGET_MESSAGE}
        ${CMD0}
     else
         echo "FASTA BOOM!"
     fi


    #--------------------------------------------------#
    # make b37 bundle list as we do not want the big bam

# START LIST >>>
b37_list="
ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/human_g1k_v37.fasta.fai.gz
ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/human_g1k_v37_decoy.fasta.fai.gz
ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/human_g1k_v37.dict.gz
ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/human_g1k_v37_decoy.dict.gz
ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/CEUTrio.HiSeq.WGS.b37.NA12878.vcf.idx.gz
ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/NA12878.knowledgebase.snapshot.20131119.b37.vcf.idx.gz
ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/1000G_phase1.indels.b37.vcf.idx.gz
ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/1000G_omni2.5.b37.vcf.idx.gz
ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/Mills_and_1000G_gold_standard.indels.b37.vcf.idx.gz
ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/NA12878.HiSeq.WGS.bwa.cleaned.raw.subset.b37.sites.vcf.idx.gz
ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/NA12878.HiSeq.WGS.bwa.cleaned.raw.subset.b37.vcf.idx.gz
ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/hapmap_3.3.b37.vcf.idx.gz
ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/hapmap_3.3_b37_pop_stratified_af.vcf.gz.tbi
ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/Broad.human.exome.b37.interval_list.gz
ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/1000G_phase3_v4_20130502.sites.vcf.gz.tbi
ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/CEUTrio.HiSeq.WGS.b37.bestPractices.b37.vcf.idx.gz
ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/1000G_phase1.snps.high_confidence.b37.vcf.idx.gz
ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/dbsnp_138.b37.excluding_sites_after_129.vcf.idx.gz
ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/dbsnp_138.b37.vcf.idx.gz
ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/NA12878.knowledgebase.snapshot.20131119.b37.vcf.gz
ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/CEUTrio.HiSeq.WGS.b37.NA12878.vcf.gz
ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/Mills_and_1000G_gold_standard.indels.b37.vcf.gz
ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/NA12878.HiSeq.WGS.bwa.cleaned.raw.subset.b37.sites.vcf.gz
ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/NA12878.HiSeq.WGS.bwa.cleaned.raw.subset.b37.vcf.gz
ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/1000G_phase1.indels.b37.vcf.gz
ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/1000G_omni2.5.b37.vcf.gz
ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/hapmap_3.3.b37.vcf.gz
ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/hapmap_3.3_b37_pop_stratified_af.vcf.gz
ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/dbsnp_138.b37.excluding_sites_after_129.vcf.gz
ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/CEUTrio.HiSeq.WGS.b37.bestPractices.b37.vcf.gz
ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/1000G_phase3_v4_20130502.sites.vcf.gz
ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/human_g1k_v37.fasta.gz
ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/human_g1k_v37_decoy.fasta.gz
ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/dbsnp_138.b37.vcf.gz
ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/b37/1000G_phase1.snps.high_confidence.b37.vcf.gz
"
# END LIST <<<

    #--------------------------------------------------#
    # get bundles
    if [[ "${GENOME}" == "b37" && "${BUNDLE}" == "bundle" ]]; then
        local CMD0="${WGET_FILE} -i ${b37_list}" # download from b37_list
        mkdir ${GENOME_DIR}/${GENOME}
        cd ${GENOME_DIR}/${GENOME}
        echo ${WGET_MESSAGE}
        ${CMD0}
    elif [[ "${GENOME}" == "b38" && "${BUNDLE}" == "bundle" ]]; then
        local URL=${b38_broad_bundle}
        local CMD0="${WGET_DIRS} ${URL}"
        cd ${GENOME_DIR}
        echo ${WGET_MESSAGE}
        ${CMD0}
    elif [[ "${GENOME}" == "b37d" && "${BUNDLE}" == "bundle" ]]; then
        local CMD0="${WGET_FILE} -i ${b37_list}" # download from b37_list
        mkdir ${GENOME_DIR}/${GENOME}
        cd ${GENOME_DIR}/${GENOME}
        echo ${WGET_MESSAGE}
        ${CMD0}
    elif [[ "${GENOME}" == "hg19" && "${BUNDLE}" == "bundle" ]]; then
        local URL=${hg19_broad_bundle}
        local CMD0="${WGET_DIRS} ${URL}"
        cd ${GENOME_DIR}
        echo ${WGET_MESSAGE}
        ${CMD0}
     else
         echo "BUNDLE BOOM!"
     fi
}