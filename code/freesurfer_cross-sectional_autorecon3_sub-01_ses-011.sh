#!/bin/bash
#SBATCH --account=rrg-pbellec
#SBATCH --job-name=freesurfer_cross-sectional_autorecon3_sub-01_ses-011.job
#SBATCH --output=./code/freesurfer_cross-sectional_autorecon3_sub-01_ses-011.out
#SBATCH --error=./code/freesurfer_cross-sectional_autorecon3_sub-01_ses-011.err
#SBATCH --time=14:00:00
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=4096M
#SBATCH --tmp=100G
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=basile.pinsard@gmail.com


set -e -u -x


export LOCAL_DATASET=$SLURM_TMPDIR/${SLURM_JOB_NAME//-/}/
flock --verbose /lustre03/project/rrg-pbellec/ria-beluga/alias/cneuromod.anat.freesurfer_longitudinal/.datalad_lock datalad clone ria+file:///lustre03/project/rrg-pbellec/ria-beluga#~cneuromod.anat.freesurfer_longitudinal@dev_rerun_t2 $LOCAL_DATASET
cd $LOCAL_DATASET
datalad get -s ria-beluga-storage -J 4 -n -r -R1 . # get sourcedata/* containers
git annex dead here
git checkout -b $SLURM_JOB_NAME

git submodule foreach  --recursive bash -c "git-annex enableremote ria-beluga-storage || true"

datalad containers-run -m 'freesurfer_sub-01/ses-011' -n bids-freesurfer-dev --input 'sourcedata/cneuromod.anat.gradcorrect/sub-01/ses-011/anat/*_T1w.nii.gz' --input 'sourcedata/cneuromod.anat.gradcorrect/sub-01/ses-011/anat/*_T2w.nii.gz'  --input 'sub-01_ses-011/' --output 'sub-01_ses-011/' -- sourcedata/cneuromod.anat.gradcorrect ./ participant --steps cross-sectional --stages autorecon3 --refine_pial T2 --hires_mode enable --participant_label 01 --session_label 011 --skip_bids_validator --license_file code/freesurfer.license --n_cpus 4 
freesurfer_exitcode=$?

flock --verbose /lustre03/project/rrg-pbellec/ria-beluga/alias/cneuromod.anat.freesurfer_longitudinal/.datalad_lock datalad push -d ./ --to origin