#!/bin/bash
#SBATCH --account=rrg-pbellec
#SBATCH --job-name=freesurfer_template_sub-04.job
#SBATCH --output=./code/freesurfer_template_sub-04.out
#SBATCH --error=./code/freesurfer_template_sub-04.err
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
git annex dead here
git checkout -b $SLURM_JOB_NAME

git submodule foreach  --recursive bash -c "git-annex enableremote ria-beluga-storage || true"

datalad containers-run -m 'fMRIPrep_sub-04/ses-*' -n bids-freesurfer --output . --input 'sourcedata/cneuromod.anat.gradcorrect/sub-04/ses-*/anat/*_T1w.nii.gz' --input 'sourcedata/cneuromod.anat.gradcorrect/sub-04/ses-*/anat/*_T2w.nii.gz' -- sourcedata/cneuromod.anat.gradcorrect ./ participant --steps template --refine_pial T2 --hires_mode enable --participant_label 04  --skip_bids_validator --license_file code/freesurfer.license --n_cpus 4 
freesurfer_exitcode=$?

flock --verbose /lustre03/project/rrg-pbellec/ria-beluga/alias/cneuromod.anat.freesurfer_longitudinal/.datalad_lock datalad push -d ./ --to origin
