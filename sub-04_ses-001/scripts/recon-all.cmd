

#---------------------------------
# New invocation of recon-all Thu Oct  5 12:15:29 UTC 2023 

 mri_convert /localscratch/bpinsard.41394469.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub04_ses001.job/sourcedata/cneuromod.anat.gradcorrect/sub-04/ses-001/anat/sub-04_ses-001_T1w.nii.gz /localscratch/bpinsard.41394469.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub04_ses001.job/sub-04_ses-001/mri/orig/001.mgz 

#--------------------------------------------
#@# MotionCor Thu Oct  5 12:15:37 UTC 2023

 cp /localscratch/bpinsard.41394469.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub04_ses001.job/sub-04_ses-001/mri/orig/001.mgz /localscratch/bpinsard.41394469.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub04_ses001.job/sub-04_ses-001/mri/rawavg.mgz 


 mri_info /localscratch/bpinsard.41394469.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub04_ses001.job/sub-04_ses-001/mri/rawavg.mgz 


 mri_convert /localscratch/bpinsard.41394469.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub04_ses001.job/sub-04_ses-001/mri/rawavg.mgz /localscratch/bpinsard.41394469.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub04_ses001.job/sub-04_ses-001/mri/orig.mgz --conform_min 


 mri_add_xform_to_header -c /localscratch/bpinsard.41394469.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub04_ses001.job/sub-04_ses-001/mri/transforms/talairach.xfm /localscratch/bpinsard.41394469.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub04_ses001.job/sub-04_ses-001/mri/orig.mgz /localscratch/bpinsard.41394469.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub04_ses001.job/sub-04_ses-001/mri/orig.mgz 


 mri_info /localscratch/bpinsard.41394469.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub04_ses001.job/sub-04_ses-001/mri/orig.mgz 

#--------------------------------------------
#@# Talairach Thu Oct  5 12:15:53 UTC 2023

 mri_nu_correct.mni --no-rescale --i orig.mgz --o orig_nu.mgz --ants-n4 --n 1 --proto-iters 1000 --distance 50 


 talairach_avi --i orig_nu.mgz --xfm transforms/talairach.auto.xfm --atlas 3T18yoSchwartzReactN32_as_orig 

talairach_avi log file is transforms/talairach_avi.log...

 cp transforms/talairach.auto.xfm transforms/talairach.xfm 

lta_convert --src orig.mgz --trg /opt/freesurfer/average/mni305.cor.mgz --inxfm transforms/talairach.xfm --outlta transforms/talairach.xfm.lta --subject fsaverage --ltavox2vox
#--------------------------------------------
#@# Talairach Failure Detection Thu Oct  5 12:25:25 UTC 2023

 talairach_afd -T 0.005 -xfm transforms/talairach.xfm 


 awk -f /opt/freesurfer/bin/extract_talairach_avi_QA.awk /localscratch/bpinsard.41394469.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub04_ses001.job/sub-04_ses-001/mri/transforms/talairach_avi.log 


 tal_QC_AZS /localscratch/bpinsard.41394469.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub04_ses001.job/sub-04_ses-001/mri/transforms/talairach_avi.log 

#--------------------------------------------
#@# Talairach Thu Oct  5 12:25:25 UTC 2023

 mri_nu_correct.mni --no-rescale --i orig.mgz --o orig_nu.mgz --ants-n4 --n 1 --proto-iters 1000 --distance 50 


 talairach --i orig_nu.mgz --xfm transforms/talairach.auto.xfm 


 cp transforms/talairach.auto.xfm transforms/talairach.xfm 

lta_convert --src orig.mgz --trg /opt/freesurfer/average/mni305.cor.mgz --inxfm transforms/talairach.xfm --outlta transforms/talairach.xfm.lta --subject fsaverage --ltavox2vox
#--------------------------------------------
#@# Talairach Failure Detection Thu Oct  5 12:34:27 UTC 2023

 talairach_afd -T 0.005 -xfm transforms/talairach.xfm 

#--------------------------------------------
#@# Nu Intensity Correction Thu Oct  5 12:34:27 UTC 2023

 mri_nu_correct.mni --i orig.mgz --o nu.mgz --uchar transforms/talairach.xfm --cm --proto-iters 1000 --distance 50 --n 1 --ants-n4 


 mri_add_xform_to_header -c /localscratch/bpinsard.41394469.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub04_ses001.job/sub-04_ses-001/mri/transforms/talairach.xfm nu.mgz nu.mgz 

#--------------------------------------------
#@# Intensity Normalization Thu Oct  5 12:44:05 UTC 2023

 mri_normalize -g 1 -seed 1234 -mprage -noconform nu.mgz T1.mgz 

#--------------------------------------------
#@# Skull Stripping Thu Oct  5 12:50:46 UTC 2023

 mri_em_register -skull nu.mgz /opt/freesurfer/average/RB_all_withskull_2020_01_02.gca transforms/talairach_with_skull.lta 


 mri_watershed -T1 -brain_atlas /opt/freesurfer/average/RB_all_withskull_2020_01_02.gca transforms/talairach_with_skull.lta T1.mgz brainmask.auto.mgz 


 cp brainmask.auto.mgz brainmask.mgz 

