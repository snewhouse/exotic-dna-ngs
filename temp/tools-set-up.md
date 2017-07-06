
## Install Anaconda or Mini-Conda

- https://conda.io/docs/help/silent.html  

`install_conda <Miniconda|Anaconda> <2|3> <>`

```bash
CONDA="Miniconda" # 
pyVERSION="3" # 2
CONDA_VERSION="4.4.0" # July 2017: latest
INSTALL_DIR="${HOME}"
ANCONDA_URL="https://repo.continuum.io/archive"
MINICONDA_URL="https://repo.continuum.io/miniconda"
ARCH="Linux-x86_64" # MacOSXx86_64

if [[ ${CONDA} == "Miniconda" ]];
    CONDA_VERSION="miniconda/Miniconda3-3.7.0-Linux-x86_64.sh"
    wget http://repo.continuum.io/${CONDA_VERSION} -O ${HOME}/conda_install.sh
    bash ${HOME}/conda_install -b -p ${HOME}/miniconda
    export PATH="$HOME/miniconda/bin:$PATH"
    rm ${HOME}/conda_install.sh
else
    CONDA_VERSION="miniconda/Miniconda3-3.7.0-Linux-x86_64.sh"
    wget http://repo.continuum.io/${CONDA_VERSION} -O ${HOME}/conda_install.sh
    bash ${HOME}/conda_install -b -p ${HOME}/anaconda
    export PATH="$HOME/miniconda/bin:$PATH"
    rm ${HOME}/conda_install.sh
fi
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
