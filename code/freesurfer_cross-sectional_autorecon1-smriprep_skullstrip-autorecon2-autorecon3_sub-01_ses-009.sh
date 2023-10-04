#!/bin/bash
#SBATCH --account=rrg-pbellec
#SBATCH --job-name=freesurfer_cross-sectional_autorecon1-smriprep_skullstrip-autorecon2-autorecon3_sub-01_ses-009.job
#SBATCH --output=./code/freesurfer_cross-sectional_autorecon1-smriprep_skullstrip-autorecon2-autorecon3_sub-01_ses-009.out
#SBATCH --error=./code/freesurfer_cross-sectional_autorecon1-smriprep_skullstrip-autorecon2-autorecon3_sub-01_ses-009.err
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
flock --verbose /lustre03/project/rrg-pbellec/ria-beluga/alias/cneuromod.anat.freesurfer_longitudinal/.datalad_lock datalad clone ria+file:///lustre03/project/rrg-pbellec/ria-beluga#~cneuromod.anat.freesurfer_longitudinal@dev $LOCAL_DATASET
cd $LOCAL_DATASET
datalad get -s ria-beluga-storage -J 4 -n -r -R1 . # get sourcedata/* containers
git annex dead here
git checkout -b $SLURM_JOB_NAME

git submodule foreach  --recursive bash -c "git-annex enableremote ria-beluga-storage || true"

datalad containers-run -m 'freesurfer_sub-01/ses-009' -n bids-freesurfer --output . --input 'sourcedata/cneuromod.anat.gradcorrect/sub-01/ses-009/anat/*_T1w.nii.gz' --input 'sourcedata/cneuromod.anat.gradcorrect/sub-01/ses-009/anat/*_T2w.nii.gz'  --output 'sub-{subject}_ses-{session}/' -- sourcedata/cneuromod.anat.gradcorrect ./ participant --steps cross-sectional --stages autorecon1  --hires_mode enable --participant_label 01 --session_label 009 --skip_bids_validator --license_file code/freesurfer.license --n_cpus 4 
datalad remove sub-01_ses-009/mri/brainmask.* || true 
datalad containers-run --input 'sourcedata/cneuromod.anat.gradcorrect/sub-01/ses-009/anat/*_T1w.nii.gz' --input 'sub-01_ses-009/mri/T1.mgz' -n brain_xtract . sub-01_ses-009 sourcedata/cneuromod.anat.gradcorrect/sub-01/ses-009/anat/*_T1w.nii.gz 
datalad containers-run -m 'freesurfer_sub-01/ses-009' -n bids-freesurfer --output . --input 'sourcedata/cneuromod.anat.gradcorrect/sub-01/ses-009/anat/*_T1w.nii.gz' --input 'sourcedata/cneuromod.anat.gradcorrect/sub-01/ses-009/anat/*_T2w.nii.gz'  --output 'sub-{subject}_ses-{session}/' -- sourcedata/cneuromod.anat.gradcorrect ./ participant --steps cross-sectional --stages autorecon2 --refine_pial T2 --hires_mode enable --participant_label 01 --session_label 009 --skip_bids_validator --license_file code/freesurfer.license --n_cpus 4 
datalad containers-run -m 'freesurfer_sub-01/ses-009' -n bids-freesurfer --output . --input 'sourcedata/cneuromod.anat.gradcorrect/sub-01/ses-009/anat/*_T1w.nii.gz' --input 'sourcedata/cneuromod.anat.gradcorrect/sub-01/ses-009/anat/*_T2w.nii.gz'  --output 'sub-{subject}_ses-{session}/' -- sourcedata/cneuromod.anat.gradcorrect ./ participant --steps cross-sectional --stages autorecon3 --refine_pial T2 --hires_mode enable --participant_label 01 --session_label 009 --skip_bids_validator --license_file code/freesurfer.license --n_cpus 4 
freesurfer_exitcode=$?

flock --verbose /lustre03/project/rrg-pbellec/ria-beluga/alias/cneuromod.anat.freesurfer_longitudinal/.datalad_lock datalad push -d ./ --to origin