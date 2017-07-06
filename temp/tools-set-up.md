
## Install Anaconda or Mini-Conda

- https://conda.io/docs/help/silent.html  

```bash
wget http://repo.continuum.io/miniconda/Miniconda3-3.7.0-Linux-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b -p $HOME/miniconda
export PATH="$HOME/miniconda/bin:$PATH"
```

make different python envs

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
