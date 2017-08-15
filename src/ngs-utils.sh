#!/usr/bin/env bash
set -e
# A selection of scripts

###-----------------------------------------------------------------------------------------------------------------###
# get_broad_genomes function
###-----------------------------------------------------------------------------------------------------------------###
get_broad_genomes(){
    #--------------------------------------------------#
    # stuff
    local VERSION="v0.1-08.17"
    local PROGNAME="get_broad_genomes"
    local ARGS="$@"
    local ECHO_BASE="[`date`][${PROGNAME}:${VERSION}]"
    local ECHO_INFO="${ECHO_BASE} [ INFO]:"
    local ECHO_ERROR="${ECHO_BASE} [ERROR]:"
    local ECHO_USAGE="${ECHO_BASE} [USAGE]:"

    #--------------------------------------------------#
    # wget commands
    local WGET_DIRS="wget -r -nH --no-parent --reject "index.html*" -e robots=off"
    local WGET_FILE="wget -nc -e robots=off"

	#--------------------------------------------------#
	# usage
	local USAGE="get_broad_genomes <b38|b37|b37d|hg19> <fasta|bundle> </PATH/TO/GENOME/DIR>}"

    #--------------------------------------------------#
	# test if arg present
	if [[ $# -eq 0 ]]; then
	    echo "${ECHO_ERROR} Check arguments supplied: [${ARGS}]"
	    echo "${ECHO_USAGE} ${USAGE}"
	    #exit 1
	else
	    echo "${ECHO_INFO} ${PROGNAME} ${ARGS}"

	#--------------------------------------------------#
	# arg 1 reference genome to get
	local GENOME=${1:-"b38"} # default b38
	echo "${ECHO_INFO} GENOME:${GENOME}"

    #--------------------------------------------------#
	# arg 2 fasta or bundle
	local BUNDLE=${2:-"fasta"} # default fasta only
	echo "${ECHO_INFO} BUNDLE:${BUNDLE}"

	#--------------------------------------------------#
	# arg 3 download directory
    local GENOME_DIR=${3:-"/home/${USER}/data/genomes/human/${GENOME}"}

	#--------------------------------------------------#
	# list downloaded files and date it
    list_genomes(){
        local LOG_DIR=${1}
        local LOG_NAME=${2}
        local TIME_STAMP="$(date +%Y%m%d.%H.%M)"
        ls -l . > ${LOG_NAME}.${TIME_STAMP}.log
    }

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
    # make b37 bundle list as we do not want the big bam

# START LIST >>>
local b37_list="
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
    # make GENOME_DIR if needed
	if [[ ! -d "${GENOME_DIR}" ]]; then
        echo "${ECHO_ERROR} Can't find ${GENOME_DIR}"
        echo "${ECHO_INFO} Creating ${GENOME_DIR}"
        local CMD0="mkdir -p ${GENOME_DIR}"
        ${CMD0}
    else
        echo "${ECHO_INFO} GENOME_DIR:${GENOME_DIR}"
    fi

    #--------------------------------------------------#
    # message
    local WGET_MESSAGE="Downloading ${GENOME} ${BUNDLE} to ${GENOME_DIR}"

    #--------------------------------------------------#
    # get fastas or bundle
    if [[ "${GENOME}" == "b37" && "${BUNDLE}" == "fasta" ]]; then
        local URL=${b37_broad_fasta}
        local FASTA="${GENOME_DIR}/human.${GENOME}.fasta.gz"
        local CMD0="${WGET_FILE} -O ${FASTA} ${URL}"
        cd ${GENOME_DIR}
        echo "${ECHO_INFO} ${WGET_MESSAGE}"
        ${CMD0}
        cd
    elif [[ "${GENOME}" == "b38" && "${BUNDLE}" == "fasta" ]]; then
        local URL=${b38_broad_fasta}
        local FASTA="${GENOME_DIR}/human.${GENOME}.fasta.gz"
        local CMD0="${WGET_FILE} -O ${FASTA} ${URL}"
        cd ${GENOME_DIR}
        echo "${ECHO_INFO} ${WGET_MESSAGE}"
        ${CMD0}
        cd
    elif [[ "${GENOME}" == "b37d" && "${BUNDLE}" == "fasta" ]]; then
        local URL=${b37_decoy_broad_fasta}
        local FASTA="${GENOME_DIR}/human.${GENOME}_decoy.fasta.gz"
        local CMD0="${WGET_FILE} -O ${FASTA} ${URL}"
        cd ${GENOME_DIR}
        echo "${ECHO_INFO} ${WGET_MESSAGE}"
        ${CMD0}
        cd
    elif [[ "${GENOME}" == "hg19" && "${BUNDLE}" == "fasta" ]]; then
        local URL=${hg19_broad_fasta}
        local FASTA="${GENOME_DIR}/human.ucsc.${GENOME}.fasta.gz"
        local CMD0="${WGET_FILE} -O ${FASTA} ${URL}"
        cd ${GENOME_DIR}
        echo "${ECHO_INFO} ${WGET_MESSAGE}"
        ${CMD0}
        cd
    elif [[ "${GENOME}" == "b37" && "${BUNDLE}" == "bundle" ]]; then
        local CMD0="${WGET_FILE} -i ${b37_list}" # download from b37_list
        mkdir ${GENOME_DIR}/${GENOME}
        cd ${GENOME_DIR}/${GENOME}
        echo "${ECHO_INFO} ${WGET_MESSAGE}"
        ${CMD0}
        cd
    elif [[ "${GENOME}" == "b38" && "${BUNDLE}" == "bundle" ]]; then
        local URL=${b38_broad_bundle}
        local CMD0="${WGET_DIRS} ${URL}"
        cd ${GENOME_DIR}
        echo "${ECHO_INFO} ${WGET_MESSAGE}"
        ${CMD0}
        cd
    elif [[ "${GENOME}" == "b37d" && "${BUNDLE}" == "bundle" ]]; then
        local CMD0="${WGET_FILE} -i ${b37_list}" # download from b37_list
        mkdir ${GENOME_DIR}/${GENOME}
        cd ${GENOME_DIR}/${GENOME}
        echo "${ECHO_INFO} ${WGET_MESSAGE}"
        ${CMD0}
        cd
    elif [[ "${GENOME}" == "hg19" && "${BUNDLE}" == "bundle" ]]; then
        local URL=${hg19_broad_bundle}
        local CMD0="${WGET_DIRS} ${URL}"
        cd ${GENOME_DIR}
        echo "${ECHO_INFO} ${WGET_MESSAGE}"
        ${CMD0}
        cd
     else
         echo "${ECHO_ERROR} Check arguments supplied"
         echo "${ECHO_USAGE} ${USAGE}"
         echo "BOOM!"
         cd
     fi
    fi
}