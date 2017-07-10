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
conda install -c bioconda ncbi-genome-download=0.2.4
conda install -c bioconda hisat2=2.1.0
conda install -c bioconda bwa=0.7.15
conda install -c bioconda samtools=1.5
conda install -c bioconda samblaster=0.1.24
conda install -c bioconda sambamba=0.6.6
conda install -c bioconda fastqc=0.11.5
conda install -c bioconda picard=2.9.2
conda install -c bioconda nextflow=0.25.1
conda install -c conda-forge awscli=1.11.70
```

## Get Reference Genomes

### Human Genomes

- [ ] b38
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