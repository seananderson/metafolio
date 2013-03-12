#!/bin/sh
#PBS -l walltime=00:20:00
#PBS -M sean_anderson@sfu.ca
#PBS -l mem=300mb

R CMD BATCH --no-save /home/anderson/Dropbox/ms/salmon_portfolios/run_multiple_mpt.R

