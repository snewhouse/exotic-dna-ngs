
## Install Anaconda or Mini-Conda

- https://conda.io/docs/help/silent.html  

`install_conda <Miniconda3|Anaconda3> <latest> <${HOME}>`

```bash
function install_conda() {
#!/usr/bin/env bash

## Defaults
local CONDA=${1} # "Miniconda3" # Anaconda
local CONDA_VERSION=${2} # "4.4.0" # July 2017: latest
local INSTALL_DIR=${3} # "${HOME}"

## URLS
readonly ANCONDA_URL="https://repo.continuum.io/archive"
readonly MINICONDA_URL="https://repo.continuum.io/miniconda"

## fixed arch to x86_64 
readonly ARCH="Linux-x86_64" # MacOSXx86_64

## Installation main
if [[ "${CONDA}" == "Miniconda3" ]]; then
    echo "[INFO: $(date)] Installing: ${CONDA}-${CONDA_VERSION}-${ARCH}"
    echo "[INFO: $(date)] Installation Directory: ${INSTALL_DIR}"
    local CONDA_BASH_INSTALL="${CONDA}-${CONDA_VERSION}-${ARCH}.sh"
    # install
    wget ${MINICONDA_URL}/${CONDA_BASH_INSTALL} -O ${INSTALL_DIR}/conda_install.sh && \
    bash ${INSTALL_DIR}/conda_install.sh -b -p ${INSTALL_DIR}/miniconda && \
    export PATH="${INSTALL_DIR}/miniconda/bin:$PATH" && \
    rm ${INSTALL_DIR}/conda_install.sh
    
elif [[ "${CONDA}" == "Anaconda3" ]]; then
    echo "[INFO: $(date)] Installing: ${CONDA}-${CONDA_VERSION}-${ARCH}"
    echo "[INFO: $(date)] Installation Directory: ${INSTALL_DIR}"
    local CONDA_BASH_INSTALL="${CONDA}-${CONDA_VERSION}-${ARCH}.sh"
    # install
    wget ${ANCONDA_URL}/${CONDA_BASH_INSTALL} -O ${INSTALL_DIR}/conda_install.sh && \
    bash ${INSTALL_DIR}/conda_install.sh -b -p ${INSTALL_DIR}/miniconda && \
    export PATH="${INSTALL_DIR}/miniconda/bin:$PATH" && \
    rm ${INSTALL_DIR}/conda_install.sh
    
else
    echo "[ERROR: $(date)] Options not recognised..exiting"
    echo "[INFO: $(date)] USAGE: install_conda.sh Miniconda3 4.4.0 ${HOME}"
    exit 1
fi
}

```

test it

```bash
install_conda.sh Miniconda3 4.4.0 ${HOME}
```


make different python envs save initial install to fix for later : get code for this

```bash
conda create -n py3k anaconda python=3
conda create -n py2k anaconda python=2
```


NOTE: This only sets the PATH for the current session, not permanently. Trying to use conda when conda is not in your PATH will cause errors such as “command not found”.

We recommend running `source $HOME/miniconda3/bin/activate` in each new bash session before using conda, which will set the PATH and run the activation scripts of your conda packages. Replace `$HOME/miniconda3/bin/activate` with the path to the activate script in your conda installation.

It is also possible to set the PATH permanently by adding a line to your .bashrc file such as export `PATH="$HOME/miniconda3/bin:$PATH"`. However, this makes it possible to use conda without running the activation scripts of your conda packages, which may produce errors.


## Tool Set up
 - Bioconda: http://bioconda.github.io/  

```bash
conda config --add channels r
conda config --add channels defaults
conda config --add channels conda-forge
conda config --add channels bioconda
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
```


align --> filter q20 --> samtools idxstats --> plot raw --> plot TPM  

local

- /mnt/lustre/users/k0959646