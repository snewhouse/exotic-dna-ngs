## Dependencies and Requirements

- Linux-x86_64
- Anaconda
- nextflow
- Optional: Docker 
- Workstation capable of running NGS pipelines (min 8-16 GB RAM, min 8 CPUs, 1TB HDD)

Tested on Linux-x86_64.

## Get the Code & installing

### Get the code

```bash
git https://github.com/snewhouse/exotic-dna-ngs.git
cd exotic-dna-ngs
```

**PoA**

- [ ] install miniconda3 or anaconda3
- [ ] create python2 conda env
- [ ] install required NGS tools
- [ ] get genomes
- [ ] index genomes 
- [ ] get test data
- [ ] test
- [ ] fastq --> alignement --> qc --> count, summarise and visualise  
- [ ] bam --> fastq --> alignement --> qc --> count, summarise and visualise 
- [ ] bash and nextflow versions
- [ ] Docker and Singularity builds

## Install Miniconda3

July 2017 Version: `Miniconda3-4.3.21-Linux-x86_64.sh` 

```bash
wget https://repo.continuum.io/miniconda/Miniconda3-4.3.21-Linux-x86_64.sh -O ./conda_install.sh && \
bash ./conda_install.sh -b -p ${HOME}/Miniconda3
export PATH="${HOME}/Miniconda3/bin:${PATH}
rm ./conda_install.sh
```

## Config Conda and Install NGS Tools

```bash
export PATH="${HOME}/Miniconda3/bin:${PATH}"
```

```bash
conda config --add channels r
conda config --add channels defaults
conda config --add channels conda-forge
conda config --add channels bioconda
```

```bash
conda create --name py2-ngs python=2
```

```bash
source activate py2-ngs
```

```bash
conda install --yes -c bioconda ncbi-genome-download=0.2.4
conda install --yes -c bioconda hisat2=2.1.0
conda install --yes -c bioconda bwa=0.7.15
conda install --yes -c bioconda samtools=1.5
conda install --yes -c bioconda samblaster=0.1.24
conda install --yes -c bioconda sambamba=0.6.6
conda install --yes -c bioconda fastqc=0.11.5
conda install --yes -c bioconda picard=2.9.2
conda install --yes -c bioconda nextflow=0.25.1
conda install --yes -c conda-forge botocore
conda install --yes -c conda-forge awscli

CONDA_PY2_BIN="${HOME}/Miniconda3/envs/py2-ngs/bin"
```

## Get Reference Genomes

### Human Genomes

- [ ] b38

- ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/technical/reference/GRCh38_reference_genome/  
- ftp://ftp.ncbi.nlm.nih.gov/genbank/genomes/Eukaryotes/vertebrates_mammals/Homo_sapiens/GRCh38/seqs_for_alignment_pipelines/README_ANALYSIS_SETS  
- ftp://ftp.ncbi.nlm.nih.gov/genbank/genomes/README.txt (it all moved)  
- ftp://ftp.ncbi.nlm.nih.gov/genomes/genbank/  
- ftp://ftp.ncbi.nlm.nih.gov/genomes/genbank/vertebrate_mammalian/Homo_sapiens/README.txt  
- ftp://ftp.ncbi.nlm.nih.gov/genomes/genbank/vertebrate_mammalian/Homo_sapiens/latest_assembly_versions/GCA_000001405.26_GRCh38.p11/README.txt  
- ftp://ftp.ncbi.nlm.nih.gov/genomes/genbank/vertebrate_mammalian/Homo_sapiens/latest_assembly_versions/GCA_000001405.26_GRCh38.p11/GCA_000001405.26_GRCh38.p11_genomic.fna.gz
- ftp://ftp.ncbi.nlm.nih.gov/genomes/genbank/vertebrate_mammalian/Homo_sapiens/latest_assembly_versions/GCA_000001405.26_GRCh38.p11/GCA_000001405.26_GRCh38.p11_assembly_report.txt  


> .# Assembly name:  GRCh38.p11  
  .# Description:    Genome Reference Consortium Human Build 38 patch release 11 (GRCh38.p11)  
  .# Organism name:  Homo sapiens (human)  
  .# Taxid:          9606  
  .# BioProject:     PRJNA31257  
  .# Submitter:      Genome Reference Consortium  
  .# Date:           2017-6-14  
  .# Assembly type:  haploid-with-alt-loci  
  .# Release type:   patch  
  .# Assembly level: Chromosome  
  .# Genome representation: full  
  .# RefSeq category: Reference Genome  
  .# GenBank assembly accession: GCA_000001405.26  

- ftp://ftp.ncbi.nlm.nih.gov/genomes/genbank/vertebrate_mammalian/Homo_sapiens/all_assembly_versions/  
- ftp://ftp.ncbi.nlm.nih.gov/genomes/refseq/vertebrate_mammalian/Homo_sapiens/latest_assembly_versions/  
- ftp://ftp.ncbi.nlm.nih.gov/genomes/refseq/vertebrate_mammalian/Homo_sapiens/latest_assembly_versions/GCF_000306695.2_CHM1_1.1/GCF_000306695.2_CHM1_1.1_genomic.fna.gz

- [ ] b37

```bash
CMD ... Boom!
```

### Non-Human Genomes

- [ ] Viral
- [ ] bacterial
- [ ] fungal

```bash
CMD ... Boom!
```

## Index Genomes

- [ ] bwa
- [ ] hisat2

```bash
CMD ... Boom!
```

## Get Test WGS Data

- [ ] [giab_data_indexes](https://github.com/genome-in-a-bottle/giab_data_indexes)
- [ ] others

```bash
CMD ... Boom!
```

## Running

- [ ] fastq

```bash
CMD ... Boom!
```

- [ ] bam

```bash
CMD ... Boom!
```

## Reporting

```bash
CMD ... Boom!
```

- [ ] pretty pictures
- [ ] count level data per sample & populations
- [ ] better way of presenting count level data...