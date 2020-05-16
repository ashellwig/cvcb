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
conda-build ./conda
```

## Configuration

Here is an example configuration file at the top level of the source directory.
This is used to point to where your "_resume_" (i.e. job details) are located.

Here is an example of the top level configuration file:

```ini
# cvcb.ini
[DEFAULT]
project_dir = /home/ahellwig/Documents/Projects/Projects_pythton/cvcb
config_path = %(project_dir)s/cvcb.ini
experience_files = %(project_dir)s/config/experience
```

Here is an example of a job details configuration file:

```ini
# config/experience/IBM.ini
[Experience]
company_name = IBM
start_date = 2017-07-01
end_date = 2017-03-01
job_title = Global Technology Services: Solutions, Del, & Transf.
job_summary = Anthem Healthcare z/OS Mainframe Administrator and State Street
              Investment Bank Help Desk Admin
job_description = Level 1.5 CTS Agent, administrator rights to remote into State
                  Street virtual desktops and physical machines after initial
                  troubleshooting as failed on other teams. Mainly services the
                  U.S. and India. Support Active Directory and configuration of
                  multiple server types. Support IBM mainframe z/OS systems.
                  Write troubleshooting and DevOps documentation and SLA status
                  templates. Deploy and maintain Windows 10 and Ent. Server
                  2012-16 Deploy Microsoft Office 365 via local source and
                  configuration manager. Development of applications for
                  z/OS utilizing various databases
skills_required = z/OS, MVS, JCL, SDSF, VSAM, Endevor, SyncSort, MQSeries, SQL,
                  SPUFI, FileAid, Xpediter
detailed_achievements = Master the Mainframe Part 2 Competitor
```
