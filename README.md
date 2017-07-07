# exotic-dna-ngs
[![DOI](https://zenodo.org/badge/96406831.svg)](https://zenodo.org/badge/latestdoi/96406831)

**VERSION:** 0.1-alhpa  
**Author:** Dr Stephen J Newhouse; stephen.j.newhouse@gmail.com

_WIP & POC: Count Viral and other non-human genome signatures in Human NGS data_  

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

The motivation: We are not alone. Things live in and on us and increasing evidence is pointing towards the importance of our microbiome 
in disease and health. Plus, DNA extraction is not perfect - unless specifically designed to enrich for human DNA, 
most DNA extraction methods will capture everything (within limits) i.e. its not just human DNA in your sample prep!.

The basic questions: 

- Can we detect other DNA in WGS NGS data?
- What is the origin of this DNA (Viral, bacterial, fungal, other...)?
- Can we quantify this is any way?
- If so, are there any menaingful differences between:
    - labs (contamination, batch procssessing etc)
    - disease groups (case v control)
    - geography
    - ...any other groups you can think off?




