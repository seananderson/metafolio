#!/bin/sh
#PBS -l walltime=00:60:00
#PBS -M sean_anderson@sfu.ca
#PBS -l mem=800mb

R CMD BATCH --no-save /home/anderson/Dropbox/ms/metafolio/inst/examples/bugaboo.R

