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

- [ ] install miniconda3 or anaconda3
- [ ] create python2 conda env
- [ ] install required NGS tools
- [ ] get genomes
- [ ] index genomes 
- [ ] get test data
- [ ] test
- [ ] fastq --> alignement --> qc --> count, sumarise and visualise  
- [ ] bam --> fastq --> alignement --> qc --> count, sumarise and visualise 

## Install Miniconda3

July 2017 Version: `Miniconda3-4.3.21-Linux-x86_64.sh` 

```bash
wget https://repo.continuum.io/miniconda/Miniconda3-4.3.21-Linux-x86_64.sh -O ./conda_install.sh && \
bash ./conda_install.sh -b -p ${HOME}/Miniconda3 && \
rm ./conda_install.sh
export PATH="${HOME}/Miniconda3/bin:${PATH}
```

## Get Reference Genomes

### Human Genomes

### Non-Human Genomes

## Running


```bash
CMD ... Boom!
```