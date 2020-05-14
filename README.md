# cvcb

## Summary

Helps with the job application process by automatically cycling through your job
details on the clipboard.

## Description

CVCB stands for "curriculum (v)itae (c)lip(b)oard". It copies the details of a
user's resume's job descriptions and cycles through them on the keyboard as well
as injects some details directly into the online application using CSS selectors
(future release).

## Prerequisites

### Anaconda

#### Setup Development Environment

```bash
# Clone sources
git clone https://github.com/ashellwig/cvcb.git --recursive
cd cvcb

# Setup Conda Environment
# https://anaconda.org/ashellwig/cvcb
conda env create -f environment.yml # From Local Repo
conda env create ashellwig/cvcb     # From Anaconda Cloud

# Build Project
```
