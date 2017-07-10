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

## Install NGS Tools

## Get Reference Genomes

### Human Genomes

- [ ] b38
- [ ] b37

### Non-Human Genomes

- [ ] Viral
- [ ] bacterial
- [ ] fungal

## Index Genomes

- [ ] bwa
- [ ] hisat2

## Get Test WGS Data

- [ ] [giab_data_indexes](https://github.com/genome-in-a-bottle/giab_data_indexes)
- [ ] others

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

- [ ] pretty pictures
- [ ] count level data per sample & populations
- [ ] better way of presenting count level data...