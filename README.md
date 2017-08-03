# exotic-dna-ngs
_WIP & POC: Count Viral and other non-human genome signatures in Human NGS data_  

[![DOI](https://zenodo.org/badge/96406831.svg)](https://zenodo.org/badge/latestdoi/96406831) [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.824201.svg)](https://doi.org/10.5281/zenodo.824201)

**VERSION:** 0.1-alhpa  
**Author:** Dr Stephen J Newhouse; stephen.j.newhouse@gmail.com

## Aims

Build a simple pipeline to detect Viral and other non-human genome signatures in WGS NGS Data.

:bulb: The idea is to use standard open source tools to detect and quantify Viral and other non-human genome signatures 
in WGS NGS Data.

The basic workflow consists of aligning short read data (using `bwa` and/or `hisat2`) to a genome index containing the 
human b38 reference sequence and all viral and other non-human genome fasta files. `samtools idxstats` will then be used 
to generate statistics on the number of mapped reads per human chromosome and viral/other genome. We will use this a 
naive measure of the presence or absence of viral/other DNA in the first instance. The number of reads mapped could be 
treated as count data, and used to produce some measure of quantification akin to RNA-seq based quantification methods 
e.g. TPM. 

**The motivation:** We are not alone. Things live in and on us and increasing evidence is pointing towards the importance of our microbiome 
in disease and health. Plus, DNA extraction is not perfect - unless specifically designed to enrich for human DNA, 
most DNA extraction methods will capture everything (within limits) i.e. its not just human DNA in your sample prep!.

**The basic questions:** 

- Can we detect other DNA in WGS NGS data?
- What is the origin of this DNA (Viral, bacterial, fungal, other...)?
- Can we quantify this is any way?
- If so, are there any menaingful differences between:
    - labs (contamination, batch procssessing etc)
    - disease groups (case v control)
    - geography
    - ...any other groups you can think off?
        

> What about [Kraken](https://ccb.jhu.edu/software/kraken/) and other awesome things like [sourmash](http://sourmash.readthedocs.io/)!? I here you say. Well, they are awesome, but compute and memory
intensive...I have yet to play with `sourmash`, but I will. I want to provide something a little less "hungry" and try and kill two birds with one stone i.e the increase in accuracy in read alignment and variant calling gained from having "decoy" genomes in the mix, and, try and query the metagenome, all at the same time. Here the decoy genomes are the viral+everything else. Hah - but, its NGS data, and will be compute intensive, and requires dowloading the world of geomes and re-inventing the wheel and blah blah blah - I hear you say again...let's see how this all turns out. 

## The Docs
- WIP: see [Docs](https://github.com/snewhouse/exotic-dna-ngs/tree/master/docs)  
- bwa mapping pipeline (nextflow): [map-bwa.nf](https://github.com/snewhouse/exotic-dna-ngs/blob/master/src/map-bwa.nf)  

**NOT TESTED!**


## Core Contributors

- Stephen J Newhouse | stephen.j.newhouse@gmail.com | git:[snewhouse](https://github.com/snewhouse) | twitter:[@s_j_newhouse](https://twitter.com/s_j_newhouse)

### Contributors

Full list at [Contributors](https://github.com/snewhouse/exotic-dna-ngs/blob/master/CONTRIBUTERS.md)


## Contributing

Here’s how we suggest you go about proposing a change to this project:

1. [Fork this project][fork] to your account.
2. [Create a branch][branch] for the change you intend to make.
3. Make your changes to your fork.
4. [Send a pull request][pr] from your fork’s branch to our `master` branch.

Using the web-based interface to make changes is fine too, and will help you
by automatically forking the project and prompting to send a pull request too.

[fork]: https://help.github.com/articles/fork-a-repo/
[branch]: https://help.github.com/articles/creating-and-deleting-branches-within-your-repository
[pr]: https://help.github.com/articles/using-pull-requests/


## Licence 
- [MIT](./LICENSE.txt)
******

<p align="center">
  Development funded as part of:</br>
  <a href="http://www.maudsleybrc.nihr.ac.uk/">NIHR Maudsley Biomedical Research Centre (BRC), King's College London</a> and the </br>  
    <a href="http://www.ucl.ac.uk/health-informatics/">Farr Institute of Health Informatics Research, UCL Institute of Health Informatics, University College London</a>
  </br>
  <a href="http://phidatalab.org/">PHI Data Lab</a>:</br>
  <a href="https://www.kcl.ac.uk/ioppn/index.aspx">Institute of Psychiatry, Psychology & Neuroscience,King's College London</a>.
</p>
