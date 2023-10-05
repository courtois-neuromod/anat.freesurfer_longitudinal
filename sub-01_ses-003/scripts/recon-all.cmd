

#---------------------------------
# New invocation of recon-all Thu Oct  5 10:43:27 UTC 2023 

 mri_convert /localscratch/bpinsard.41394414.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub01_ses003.job/sourcedata/cneuromod.anat.gradcorrect/sub-01/ses-003/anat/sub-01_ses-003_T1w.nii.gz /localscratch/bpinsard.41394414.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub01_ses003.job/sub-01_ses-003/mri/orig/001.mgz 

#--------------------------------------------
#@# MotionCor Thu Oct  5 10:43:36 UTC 2023

 cp /localscratch/bpinsard.41394414.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub01_ses003.job/sub-01_ses-003/mri/orig/001.mgz /localscratch/bpinsard.41394414.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub01_ses003.job/sub-01_ses-003/mri/rawavg.mgz 


 mri_info /localscratch/bpinsard.41394414.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub01_ses003.job/sub-01_ses-003/mri/rawavg.mgz 


 mri_convert /localscratch/bpinsard.41394414.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub01_ses003.job/sub-01_ses-003/mri/rawavg.mgz /localscratch/bpinsard.41394414.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub01_ses003.job/sub-01_ses-003/mri/orig.mgz --conform_min 


 mri_add_xform_to_header -c /localscratch/bpinsard.41394414.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub01_ses003.job/sub-01_ses-003/mri/transforms/talairach.xfm /localscratch/bpinsard.41394414.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub01_ses003.job/sub-01_ses-003/mri/orig.mgz /localscratch/bpinsard.41394414.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub01_ses003.job/sub-01_ses-003/mri/orig.mgz 


 mri_info /localscratch/bpinsard.41394414.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub01_ses003.job/sub-01_ses-003/mri/orig.mgz 

#--------------------------------------------
#@# Talairach Thu Oct  5 10:43:53 UTC 2023

 mri_nu_correct.mni --no-rescale --i orig.mgz --o orig_nu.mgz --ants-n4 --n 1 --proto-iters 1000 --distance 50 


 talairach_avi --i orig_nu.mgz --xfm transforms/talairach.auto.xfm --atlas 3T18yoSchwartzReactN32_as_orig 

talairach_avi log file is transforms/talairach_avi.log...

 cp transforms/talairach.auto.xfm transforms/talairach.xfm 

lta_convert --src orig.mgz --trg /opt/freesurfer/average/mni305.cor.mgz --inxfm transforms/talairach.xfm --outlta transforms/talairach.xfm.lta --subject fsaverage --ltavox2vox
#--------------------------------------------
#@# Talairach Failure Detection Thu Oct  5 10:53:30 UTC 2023

 talairach_afd -T 0.005 -xfm transforms/talairach.xfm 


 awk -f /opt/freesurfer/bin/extract_talairach_avi_QA.awk /localscratch/bpinsard.41394414.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub01_ses003.job/sub-01_ses-003/mri/transforms/talairach_avi.log 


 tal_QC_AZS /localscratch/bpinsard.41394414.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub01_ses003.job/sub-01_ses-003/mri/transforms/talairach_avi.log 

#--------------------------------------------
#@# Talairach Thu Oct  5 10:53:30 UTC 2023

 mri_nu_correct.mni --no-rescale --i orig.mgz --o orig_nu.mgz --ants-n4 --n 1 --proto-iters 1000 --distance 50 


 talairach --i orig_nu.mgz --xfm transforms/talairach.auto.xfm 


 cp transforms/talairach.auto.xfm transforms/talairach.xfm 

lta_convert --src orig.mgz --trg /opt/freesurfer/average/mni305.cor.mgz --inxfm transforms/talairach.xfm --outlta transforms/talairach.xfm.lta --subject fsaverage --ltavox2vox
#--------------------------------------------
#@# Talairach Failure Detection Thu Oct  5 11:02:37 UTC 2023

 talairach_afd -T 0.005 -xfm transforms/talairach.xfm 

#--------------------------------------------
#@# Nu Intensity Correction Thu Oct  5 11:02:37 UTC 2023

 mri_nu_correct.mni --i orig.mgz --o nu.mgz --uchar transforms/talairach.xfm --cm --proto-iters 1000 --distance 50 --n 1 --ants-n4 


 mri_add_xform_to_header -c /localscratch/bpinsard.41394414.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub01_ses003.job/sub-01_ses-003/mri/transforms/talairach.xfm nu.mgz nu.mgz 

#--------------------------------------------
#@# Intensity Normalization Thu Oct  5 11:12:20 UTC 2023

 mri_normalize -g 1 -seed 1234 -mprage -noconform nu.mgz T1.mgz 

#--------------------------------------------
#@# Skull Stripping Thu Oct  5 11:19:22 UTC 2023

 mri_em_register -skull nu.mgz /opt/freesurfer/average/RB_all_withskull_2020_01_02.gca transforms/talairach_with_skull.lta 


 mri_watershed -T1 -brain_atlas /opt/freesurfer/average/RB_all_withskull_2020_01_02.gca transforms/talairach_with_skull.lta T1.mgz brainmask.auto.mgz 


 cp brainmask.auto.mgz brainmask.mgz 



#---------------------------------
# New invocation of recon-all Thu Oct  5 11:50:15 UTC 2023 
#-------------------------------------
#@# EM Registration Thu Oct  5 11:50:17 UTC 2023

 mri_em_register -uns 3 -mask brainmask.mgz nu.mgz /opt/freesurfer/average/RB_all_2020-01-02.gca transforms/talairach.lta 

#--------------------------------------
#@# CA Normalize Thu Oct  5 11:54:05 UTC 2023

 mri_ca_normalize -c ctrl_pts.mgz -mask brainmask.mgz nu.mgz /opt/freesurfer/average/RB_all_2020-01-02.gca transforms/talairach.lta norm.mgz 

#--------------------------------------
#@# CA Reg Thu Oct  5 11:57:42 UTC 2023

 mri_ca_register -nobigventricles -T transforms/talairach.lta -align-after -mask brainmask.mgz norm.mgz /opt/freesurfer/average/RB_all_2020-01-02.gca transforms/talairach.m3z 

#--------------------------------------
#@# SubCort Seg Thu Oct  5 13:15:28 UTC 2023

 mri_ca_label -relabel_unlikely 9 .3 -prior 0.5 -align norm.mgz transforms/talairach.m3z /opt/freesurfer/average/RB_all_2020-01-02.gca aseg.auto_noCCseg.mgz 

#--------------------------------------
#@# CC Seg Thu Oct  5 15:11:34 UTC 2023

 mri_cc -aseg aseg.auto_noCCseg.mgz -o aseg.auto.mgz -lta /localscratch/bpinsard.41394414.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub01_ses003.job/sub-01_ses-003/mri/transforms/cc_up.lta sub-01_ses-003 

#--------------------------------------
#@# Merge ASeg Thu Oct  5 15:16:22 UTC 2023

 cp aseg.auto.mgz aseg.presurf.mgz 

#--------------------------------------------
#@# Intensity Normalization2 Thu Oct  5 15:16:22 UTC 2023

 mri_normalize -seed 1234 -mprage -aseg aseg.presurf.mgz -mask brainmask.mgz norm.mgz brain.mgz 

#--------------------------------------------
#@# Mask BFS Thu Oct  5 15:24:56 UTC 2023

 mri_mask -T 5 brain.mgz brainmask.mgz brain.finalsurfs.mgz 

#--------------------------------------------
#@# WM Segmentation Thu Oct  5 15:24:59 UTC 2023

 AntsDenoiseImageFs -i brain.mgz -o antsdn.brain.mgz 


 mri_segment -wsizemm 13 -mprage antsdn.brain.mgz wm.seg.mgz 


 mri_edit_wm_with_aseg -keep-in wm.seg.mgz brain.mgz aseg.presurf.mgz wm.asegedit.mgz 


 mri_pretess wm.asegedit.mgz wm norm.mgz wm.mgz 

#--------------------------------------------
#@# Fill Thu Oct  5 15:33:27 UTC 2023

 mri_fill -a ../scripts/ponscc.cut.log -xform transforms/talairach.lta -segmentation aseg.presurf.mgz -ctab /opt/freesurfer/SubCorticalMassLUT.txt wm.mgz filled.mgz 

 cp filled.mgz filled.auto.mgz
#--------------------------------------------
#@# Tessellate lh Thu Oct  5 15:36:38 UTC 2023

 mri_pretess ../mri/filled.mgz 255 ../mri/norm.mgz ../mri/filled-pretess255.mgz 


 mri_tessellate ../mri/filled-pretess255.mgz 255 ../surf/lh.orig.nofix 


 rm -f ../mri/filled-pretess255.mgz 


 mris_extract_main_component ../surf/lh.orig.nofix ../surf/lh.orig.nofix 

#--------------------------------------------
#@# Tessellate rh Thu Oct  5 15:36:48 UTC 2023

 mri_pretess ../mri/filled.mgz 127 ../mri/norm.mgz ../mri/filled-pretess127.mgz 


 mri_tessellate ../mri/filled-pretess127.mgz 127 ../surf/rh.orig.nofix 


 rm -f ../mri/filled-pretess127.mgz 


 mris_extract_main_component ../surf/rh.orig.nofix ../surf/rh.orig.nofix 

#--------------------------------------------
#@# Smooth1 lh Thu Oct  5 15:36:57 UTC 2023

 mris_smooth -nw -seed 1234 ../surf/lh.orig.nofix ../surf/lh.smoothwm.nofix 

#--------------------------------------------
#@# Smooth1 rh Thu Oct  5 15:37:03 UTC 2023

 mris_smooth -nw -seed 1234 ../surf/rh.orig.nofix ../surf/rh.smoothwm.nofix 

#--------------------------------------------
#@# Inflation1 lh Thu Oct  5 15:37:10 UTC 2023

 mris_inflate -no-save-sulc ../surf/lh.smoothwm.nofix ../surf/lh.inflated.nofix 

#--------------------------------------------
#@# Inflation1 rh Thu Oct  5 15:37:43 UTC 2023

 mris_inflate -no-save-sulc ../surf/rh.smoothwm.nofix ../surf/rh.inflated.nofix 

#--------------------------------------------
#@# QSphere lh Thu Oct  5 15:38:16 UTC 2023

 mris_sphere -q -p 6 -a 128 -seed 1234 ../surf/lh.inflated.nofix ../surf/lh.qsphere.nofix 

#--------------------------------------------
#@# QSphere rh Thu Oct  5 15:40:58 UTC 2023

 mris_sphere -q -p 6 -a 128 -seed 1234 ../surf/rh.inflated.nofix ../surf/rh.qsphere.nofix 

#@# Fix Topology lh Thu Oct  5 15:43:46 UTC 2023

 mris_fix_topology -mgz -sphere qsphere.nofix -inflated inflated.nofix -orig orig.nofix -out orig.premesh -ga -seed 1234 sub-01_ses-003 lh 

#@# Fix Topology rh Thu Oct  5 15:47:06 UTC 2023

 mris_fix_topology -mgz -sphere qsphere.nofix -inflated inflated.nofix -orig orig.nofix -out orig.premesh -ga -seed 1234 sub-01_ses-003 rh 


 mris_euler_number ../surf/lh.orig.premesh 


 mris_euler_number ../surf/rh.orig.premesh 


 mris_remesh --remesh --iters 3 --input /localscratch/bpinsard.41394414.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub01_ses003.job/sub-01_ses-003/surf/lh.orig.premesh --output /localscratch/bpinsard.41394414.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub01_ses003.job/sub-01_ses-003/surf/lh.orig 


 mris_remesh --remesh --iters 3 --input /localscratch/bpinsard.41394414.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub01_ses003.job/sub-01_ses-003/surf/rh.orig.premesh --output /localscratch/bpinsard.41394414.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub01_ses003.job/sub-01_ses-003/surf/rh.orig 


 mris_remove_intersection ../surf/lh.orig ../surf/lh.orig 


 rm -f ../surf/lh.inflated 


 mris_remove_intersection ../surf/rh.orig ../surf/rh.orig 


 rm -f ../surf/rh.inflated 

#--------------------------------------------
#@# AutoDetGWStats lh Thu Oct  5 15:52:47 UTC 2023
cd /localscratch/bpinsard.41394414.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub01_ses003.job/sub-01_ses-003/mri
mris_autodet_gwstats --o ../surf/autodet.gw.stats.lh.dat --i brain.finalsurfs.mgz --wm wm.mgz --surf ../surf/lh.orig.premesh
#--------------------------------------------
#@# AutoDetGWStats rh Thu Oct  5 15:52:57 UTC 2023
cd /localscratch/bpinsard.41394414.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub01_ses003.job/sub-01_ses-003/mri
mris_autodet_gwstats --o ../surf/autodet.gw.stats.rh.dat --i brain.finalsurfs.mgz --wm wm.mgz --surf ../surf/rh.orig.premesh
#--------------------------------------------
#@# WhitePreAparc lh Thu Oct  5 15:53:07 UTC 2023
cd /localscratch/bpinsard.41394414.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub01_ses003.job/sub-01_ses-003/mri
mris_place_surface --adgws-in ../surf/autodet.gw.stats.lh.dat --wm wm.mgz --threads 4 --invol brain.finalsurfs.mgz --lh --i ../surf/lh.orig --o ../surf/lh.white.preaparc --white --seg aseg.presurf.mgz --nsmooth 5
#--------------------------------------------
#@# WhitePreAparc rh Thu Oct  5 15:58:39 UTC 2023
cd /localscratch/bpinsard.41394414.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub01_ses003.job/sub-01_ses-003/mri
mris_place_surface --adgws-in ../surf/autodet.gw.stats.rh.dat --wm wm.mgz --threads 4 --invol brain.finalsurfs.mgz --rh --i ../surf/rh.orig --o ../surf/rh.white.preaparc --white --seg aseg.presurf.mgz --nsmooth 5
#--------------------------------------------
#@# CortexLabel lh Thu Oct  5 16:04:00 UTC 2023
cd /localscratch/bpinsard.41394414.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub01_ses003.job/sub-01_ses-003/mri
mri_label2label --label-cortex ../surf/lh.white.preaparc aseg.presurf.mgz 0 ../label/lh.cortex.label
#--------------------------------------------
#@# CortexLabel+HipAmyg lh Thu Oct  5 16:04:36 UTC 2023
cd /localscratch/bpinsard.41394414.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub01_ses003.job/sub-01_ses-003/mri
mri_label2label --label-cortex ../surf/lh.white.preaparc aseg.presurf.mgz 1 ../label/lh.cortex+hipamyg.label
#--------------------------------------------
#@# CortexLabel rh Thu Oct  5 16:05:12 UTC 2023
cd /localscratch/bpinsard.41394414.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub01_ses003.job/sub-01_ses-003/mri
mri_label2label --label-cortex ../surf/rh.white.preaparc aseg.presurf.mgz 0 ../label/rh.cortex.label
#--------------------------------------------
#@# CortexLabel+HipAmyg rh Thu Oct  5 16:05:53 UTC 2023
cd /localscratch/bpinsard.41394414.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub01_ses003.job/sub-01_ses-003/mri
mri_label2label --label-cortex ../surf/rh.white.preaparc aseg.presurf.mgz 1 ../label/rh.cortex+hipamyg.label
#--------------------------------------------
#@# Smooth2 lh Thu Oct  5 16:06:34 UTC 2023

 mris_smooth -n 3 -nw -seed 1234 ../surf/lh.white.preaparc ../surf/lh.smoothwm 

#--------------------------------------------
#@# Smooth2 rh Thu Oct  5 16:06:41 UTC 2023

 mris_smooth -n 3 -nw -seed 1234 ../surf/rh.white.preaparc ../surf/rh.smoothwm 

#--------------------------------------------
#@# Inflation2 lh Thu Oct  5 16:06:49 UTC 2023

 mris_inflate ../surf/lh.smoothwm ../surf/lh.inflated 

#--------------------------------------------
#@# Inflation2 rh Thu Oct  5 16:07:30 UTC 2023

 mris_inflate ../surf/rh.smoothwm ../surf/rh.inflated 

#--------------------------------------------
#@# Curv .H and .K lh Thu Oct  5 16:08:10 UTC 2023

 mris_curvature -w -seed 1234 lh.white.preaparc 


 mris_curvature -seed 1234 -thresh .999 -n -a 5 -w -distances 10 10 lh.inflated 

#--------------------------------------------
#@# Curv .H and .K rh Thu Oct  5 16:10:05 UTC 2023

 mris_curvature -w -seed 1234 rh.white.preaparc 


 mris_curvature -seed 1234 -thresh .999 -n -a 5 -w -distances 10 10 rh.inflated 
