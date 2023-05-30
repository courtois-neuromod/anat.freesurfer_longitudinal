#!/bin/bash
#SBATCH --account=rrg-pbellec
#SBATCH --job-name=freesurfer_cross-sectional_sub-04_ses-001.job
#SBATCH --output=/lustre04/scratch/bpinsard/anat.freesurfer_longitudinal/code/freesurfer_cross-sectional_sub-04_ses-001.out
#SBATCH --error=/lustre04/scratch/bpinsard/anat.freesurfer_longitudinal/code/freesurfer_cross-sectional_sub-04_ses-001.err
#SBATCH --time=24:00:00
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=4096M
#SBATCH --tmp=100G
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=None

 
set -e -u -x


export LOCAL_DATASET=$SLURM_TMPDIR/${SLURM_JOB_NAME//-/}/
flock --verbose /lustre03/project/rrg-pbellec/ria-beluga/alias/cneuromod.anat.freesurfer_longitudinal/.datalad_lock datalad clone ria+file:///lustre03/project/rrg-pbellec/ria-beluga#~cneuromod.anat.freesurfer_longitudinal $LOCAL_DATASET
cd $LOCAL_DATASET
datalad get -s ria-beluga-storage -J 4 -n -r -R1 . # get sourcedata/* containers
git submodule foreach --recursive git annex dead here
git checkout -b $SLURM_JOB_NAME

git submodule foreach  --recursive git-annex enableremote ria-beluga-storage

datalad containers-run -m 'fMRIPrep_sub-04/ses-001' -n containers/bids-freesurfer--6.0.1-6.1 --output . --input 'sourcedata/cneuromod.anat/sub-04/ses-001/anat/*_T1w.nii.gz' --input 'sourcedata/cneuromod.anat/sub-04/ses-001/anat/*_T2w.nii.gz' --input 'sourcedata/cneuromod.anat/sub-04/ses-001/anat/*_FLAIR.nii.gz' -- -w ./workdir --participant-label 04  --n_cpus 8 --fs-license-file code/freesurfer.license sourcedata/cneuromod.anat ./ participant 
freesurfer_exitcode=$?

flock --verbose /lustre03/project/rrg-pbellec/ria-beluga/alias/cneuromod.anat.freesurfer_longitudinal/.datalad_lock datalad push -d ./ --to origin
