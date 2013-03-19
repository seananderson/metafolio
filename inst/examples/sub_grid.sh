#!/bin/sh
#PBS -l walltime=00:50:00
#PBS -M sean_anderson@sfu.ca
#PBS -l mem=400mb

R CMD BATCH --no-save /home/anderson/Dropbox/ms/metafolio/inst/examples/run_multiple_mpt.R

