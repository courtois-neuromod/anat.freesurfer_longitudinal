#!/bin/bash
#SBATCH --account=rrg-pbellec
#SBATCH --job-name=freesurfer_cross-sectional_sub-01_ses-006.job
#SBATCH --output=/lustre04/scratch/bpinsard/anat.freesurfer_longitudinal/code/freesurfer_cross-sectional_sub-01_ses-006.out
#SBATCH --error=/lustre04/scratch/bpinsard/anat.freesurfer_longitudinal/code/freesurfer_cross-sectional_sub-01_ses-006.err
#SBATCH --time=24:00:00
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=4096M
#SBATCH --tmp=100G
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=basile.pinsard@gmail.com

 
set -e -u -x


export LOCAL_DATASET=$SLURM_TMPDIR/${SLURM_JOB_NAME//-/}/
flock --verbose /lustre03/project/rrg-pbellec/ria-beluga/alias/cneuromod.anat.freesurfer_longitudinal/.datalad_lock datalad clone ria+file:///lustre03/project/rrg-pbellec/ria-beluga#~cneuromod.anat.freesurfer_longitudinal $LOCAL_DATASET
cd $LOCAL_DATASET
datalad get -s ria-beluga-storage -J 4 -n -r -R1 . # get sourcedata/* containers
git submodule foreach --recursive git annex dead here
git checkout -b $SLURM_JOB_NAME

git submodule foreach  --recursive git-annex enableremote ria-beluga-storage

datalad containers-run -m 'fMRIPrep_sub-01/ses-006' -n containers/bids-freesurfer --output . --input 'sourcedata/cneuromod.anat/sub-01/ses-006/anat/*_T1w.nii.gz' --input 'sourcedata/cneuromod.anat/sub-01/ses-006/anat/*_T2w.nii.gz' --input 'sourcedata/cneuromod.anat/sub-01/ses-006/anat/*_FLAIR.nii.gz' -- sourcedata/cneuromod.anat ./ participant --steps cross-sectional --refine_pial --reconstruction_label norm --refine_pial_reconstruction_label norm --hires_mode enable --participant_label 01 --session_label 006 --skip_bids_validator --license_file code/freesurfer.license --n_cpus 4 
freesurfer_exitcode=$?

flock --verbose /lustre03/project/rrg-pbellec/ria-beluga/alias/cneuromod.anat.freesurfer_longitudinal/.datalad_lock datalad push -d ./ --to origin
