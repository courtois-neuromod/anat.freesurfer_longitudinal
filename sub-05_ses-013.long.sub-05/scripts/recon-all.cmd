

#---------------------------------
# New invocation of recon-all Fri Oct 13 00:22:27 UTC 2023 

 cp /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05/mri/brainmask.mgz ./brainmask_sub-05.mgz 


 cp /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05/mri/transforms/talairach.lta transforms/talairach.lta 


 cp /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05/mri/aseg.mgz aseg_sub-05.mgz 


 cp /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05/surf/lh.white /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/surf/lh.orig 


 cp /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05/surf/lh.white /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/surf/lh.orig_white 


 cp /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05/surf/lh.pial /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/surf/lh.orig_pial 


 cp /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05/surf/rh.white /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/surf/rh.orig 


 cp /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05/surf/rh.white /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/surf/rh.orig_white 


 cp /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05/surf/rh.pial /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/surf/rh.orig_pial 

#--------------------------------------------
#@# MotionCor Fri Oct 13 00:23:11 UTC 2023
#--------------------------------------------
#@# Talairach Fri Oct 13 00:23:11 UTC 2023

 cp /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05/mri/transforms/talairach.xfm /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/mri/transforms/talairach.auto.xfm 

talairach_avi log file is transforms/talairach_avi.log...

 cp transforms/talairach.auto.xfm transforms/talairach.xfm 

lta_convert --src orig.mgz --trg /opt/freesurfer/average/mni305.cor.mgz --inxfm transforms/talairach.xfm --outlta transforms/talairach.xfm.lta --subject fsaverage --ltavox2vox
#--------------------------------------------
#@# Talairach Failure Detection Fri Oct 13 00:23:13 UTC 2023

 talairach_afd -T 0.005 -xfm transforms/talairach.xfm 

#--------------------------------------------
#@# Nu Intensity Correction Fri Oct 13 00:23:13 UTC 2023

 mri_nu_correct.mni --i orig.mgz --o nu.mgz --uchar transforms/talairach.xfm --n 2 --ants-n4 


 mri_add_xform_to_header -c /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/mri/transforms/talairach.xfm nu.mgz nu.mgz 

#--------------------------------------------
#@# Intensity Normalization Fri Oct 13 00:32:48 UTC 2023

 mri_nu_correct.mni --no-rescale --i orig.mgz --o orig_nu.mgz --n 1 --proto-iters 1000 --distance 200 --ants-n4 


 mri_normalize -g 1 -seed 1234 -mprage nu.mgz T1.mgz 

#--------------------------------------------
#@# Skull Stripping Fri Oct 13 00:50:12 UTC 2023

 mri_mask -keep_mask_deletion_edits T1.mgz brainmask_sub-05.mgz brainmask.auto.mgz 


 mri_mask -transfer 255 -keep_mask_deletion_edits brainmask.auto.mgz brainmask_sub-05.mgz brainmask.auto.mgz 


 cp brainmask.auto.mgz brainmask.mgz 

#-------------------------------------
#@# EM Registration Fri Oct 13 00:50:19 UTC 2023
#--------------------------------------
#@# CA Normalize Fri Oct 13 00:50:19 UTC 2023

 mri_ca_normalize -long aseg_sub-05.mgz -mask brainmask.mgz nu.mgz /opt/freesurfer/average/RB_all_2020-01-02.gca transforms/talairach.lta norm.mgz 

#--------------------------------------
#@# CA Reg Fri Oct 13 00:54:30 UTC 2023

 mri_ca_register -nobigventricles -levels 2 -A 1 -l /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05/mri/transforms/talairach.m3z identity.nofile -align-after -mask brainmask.mgz norm.mgz /opt/freesurfer/average/RB_all_2020-01-02.gca transforms/talairach.m3z 

#--------------------------------------
#@# SubCort Seg Fri Oct 13 01:19:40 UTC 2023

 mri_fuse_segmentations -a /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-003/mri/aseg.presurf.mgz /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-008/mri/aseg.presurf.mgz /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-004/mri/aseg.presurf.mgz /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-002/mri/aseg.presurf.mgz /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-007/mri/aseg.presurf.mgz /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-006/mri/aseg.presurf.mgz /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-012/mri/aseg.presurf.mgz /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-010/mri/aseg.presurf.mgz /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013/mri/aseg.presurf.mgz /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-001/mri/aseg.presurf.mgz /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-011/mri/aseg.presurf.mgz /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-005/mri/aseg.presurf.mgz /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-009/mri/aseg.presurf.mgz -c /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-003/mri/aseg.auto_noCCseg.mgz /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-008/mri/aseg.auto_noCCseg.mgz /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-004/mri/aseg.auto_noCCseg.mgz /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-002/mri/aseg.auto_noCCseg.mgz /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-007/mri/aseg.auto_noCCseg.mgz /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-006/mri/aseg.auto_noCCseg.mgz /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-012/mri/aseg.auto_noCCseg.mgz /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-010/mri/aseg.auto_noCCseg.mgz /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013/mri/aseg.auto_noCCseg.mgz /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-001/mri/aseg.auto_noCCseg.mgz /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-011/mri/aseg.auto_noCCseg.mgz /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-005/mri/aseg.auto_noCCseg.mgz /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-009/mri/aseg.auto_noCCseg.mgz -n /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-003/mri/norm.mgz /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-008/mri/norm.mgz /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-004/mri/norm.mgz /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-002/mri/norm.mgz /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-007/mri/norm.mgz /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-006/mri/norm.mgz /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-012/mri/norm.mgz /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-010/mri/norm.mgz /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013/mri/norm.mgz /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-001/mri/norm.mgz /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-011/mri/norm.mgz /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-005/mri/norm.mgz /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-009/mri/norm.mgz -t /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05/mri/transforms/sub-05_ses-003_to_sub-05.lta /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05/mri/transforms/sub-05_ses-008_to_sub-05.lta /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05/mri/transforms/sub-05_ses-004_to_sub-05.lta /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05/mri/transforms/sub-05_ses-002_to_sub-05.lta /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05/mri/transforms/sub-05_ses-007_to_sub-05.lta /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05/mri/transforms/sub-05_ses-006_to_sub-05.lta /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05/mri/transforms/sub-05_ses-012_to_sub-05.lta /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05/mri/transforms/sub-05_ses-010_to_sub-05.lta /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05/mri/transforms/sub-05_ses-013_to_sub-05.lta /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05/mri/transforms/sub-05_ses-001_to_sub-05.lta /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05/mri/transforms/sub-05_ses-011_to_sub-05.lta /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05/mri/transforms/sub-05_ses-005_to_sub-05.lta /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05/mri/transforms/sub-05_ses-009_to_sub-05.lta norm.mgz aseg.fused.mgz 


 mri_ca_label -relabel_unlikely 9 .3 -prior 0.5 -align -r /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/mri/aseg.fused.mgz -ri /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05/mri/aseg.auto_noCCseg.label_intensities.txt norm.mgz transforms/talairach.m3z /opt/freesurfer/average/RB_all_2020-01-02.gca aseg.auto_noCCseg.mgz 

#--------------------------------------
#@# CC Seg Fri Oct 13 01:31:56 UTC 2023

 mri_cc -aseg aseg.auto_noCCseg.mgz -o aseg.auto.mgz -lta /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/mri/transforms/cc_up.lta sub-05_ses-013.long.sub-05 

#--------------------------------------
#@# Merge ASeg Fri Oct 13 01:34:01 UTC 2023

 cp aseg.auto.mgz aseg.presurf.mgz 

#--------------------------------------------
#@# Intensity Normalization2 Fri Oct 13 01:34:01 UTC 2023

 mri_normalize -seed 1234 -mprage -aseg aseg.presurf.mgz -mask brainmask.mgz norm.mgz brain.mgz 

#--------------------------------------------
#@# Mask BFS Fri Oct 13 01:41:05 UTC 2023

 mri_mask -T 5 brain.mgz brainmask.mgz brain.finalsurfs.mgz 


 mri_mask -transfer 255 -keep_mask_deletion_edits -xform /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05/mri/transforms/sub-05_ses-013_to_sub-05.lta brain.finalsurfs.mgz /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013/mri/brain.finalsurfs.manedit.mgz brain.finalsurfs.mgz 

#--------------------------------------------
#@# WM Segmentation Fri Oct 13 01:41:13 UTC 2023

 AntsDenoiseImageFs -i brain.mgz -o antsdn.brain.mgz 


 mri_segment -wsizemm 13 -mprage antsdn.brain.mgz wm.seg.mgz 


 mri_edit_wm_with_aseg -keep-in wm.seg.mgz brain.mgz aseg.presurf.mgz wm.asegedit.mgz 


 mri_pretess wm.asegedit.mgz wm norm.mgz wm.mgz 


 mri_mask -transfer 255 -keep_mask_deletion_edits -xform /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05/mri/transforms/sub-05_ses-013_to_sub-05.lta wm.mgz /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013/mri/wm.mgz wm.mgz 

#--------------------------------------------
#@# AutoDetGWStats lh Fri Oct 13 01:49:08 UTC 2023
cd /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/mri
mris_autodet_gwstats --o ../surf/autodet.gw.stats.lh.dat --i brain.finalsurfs.mgz --wm wm.mgz --surf ../surf/lh.orig
#--------------------------------------------
#@# AutoDetGWStats rh Fri Oct 13 01:49:18 UTC 2023
cd /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/mri
mris_autodet_gwstats --o ../surf/autodet.gw.stats.rh.dat --i brain.finalsurfs.mgz --wm wm.mgz --surf ../surf/rh.orig
#--------------------------------------------
#@# WhitePreAparc lh Fri Oct 13 01:49:29 UTC 2023
cd /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/mri
mris_place_surface --adgws-in ../surf/autodet.gw.stats.lh.dat --wm wm.mgz --threads 4 --invol brain.finalsurfs.mgz --lh --i ../surf/lh.orig --o ../surf/lh.white.preaparc --white --seg aseg.presurf.mgz --max-cbv-dist 3.5
#--------------------------------------------
#@# WhitePreAparc rh Fri Oct 13 01:53:59 UTC 2023
cd /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/mri
mris_place_surface --adgws-in ../surf/autodet.gw.stats.rh.dat --wm wm.mgz --threads 4 --invol brain.finalsurfs.mgz --rh --i ../surf/rh.orig --o ../surf/rh.white.preaparc --white --seg aseg.presurf.mgz --max-cbv-dist 3.5
#--------------------------------------------
#@# CortexLabel lh Fri Oct 13 01:58:37 UTC 2023
cd /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/mri
mri_label2label --label-cortex ../surf/lh.white.preaparc aseg.presurf.mgz 0 ../label/lh.cortex.label
#--------------------------------------------
#@# CortexLabel+HipAmyg lh Fri Oct 13 01:59:08 UTC 2023
cd /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/mri
mri_label2label --label-cortex ../surf/lh.white.preaparc aseg.presurf.mgz 1 ../label/lh.cortex+hipamyg.label
#--------------------------------------------
#@# CortexLabel rh Fri Oct 13 01:59:39 UTC 2023
cd /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/mri
mri_label2label --label-cortex ../surf/rh.white.preaparc aseg.presurf.mgz 0 ../label/rh.cortex.label
#--------------------------------------------
#@# CortexLabel+HipAmyg rh Fri Oct 13 02:00:10 UTC 2023
cd /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/mri
mri_label2label --label-cortex ../surf/rh.white.preaparc aseg.presurf.mgz 1 ../label/rh.cortex+hipamyg.label
#--------------------------------------------
#@# Smooth2 lh Fri Oct 13 02:00:40 UTC 2023

 mris_smooth -n 3 -nw -seed 1234 ../surf/lh.white.preaparc ../surf/lh.smoothwm 

#--------------------------------------------
#@# Smooth2 rh Fri Oct 13 02:00:47 UTC 2023

 mris_smooth -n 3 -nw -seed 1234 ../surf/rh.white.preaparc ../surf/rh.smoothwm 

#--------------------------------------------
#@# Inflation2 lh Fri Oct 13 02:00:53 UTC 2023

 mris_inflate ../surf/lh.smoothwm ../surf/lh.inflated 

#--------------------------------------------
#@# Inflation2 rh Fri Oct 13 02:01:21 UTC 2023

 mris_inflate ../surf/rh.smoothwm ../surf/rh.inflated 

#--------------------------------------------
#@# Curv .H and .K lh Fri Oct 13 02:01:49 UTC 2023

 mris_curvature -w -seed 1234 lh.white.preaparc 


 mris_curvature -seed 1234 -thresh .999 -n -a 5 -w -distances 10 10 lh.inflated 

#--------------------------------------------
#@# Curv .H and .K rh Fri Oct 13 02:03:36 UTC 2023

 mris_curvature -w -seed 1234 rh.white.preaparc 


 mris_curvature -seed 1234 -thresh .999 -n -a 5 -w -distances 10 10 rh.inflated 

#--------------------------------------------
#@# Sphere lh Fri Oct 13 02:05:25 UTC 2023
#--------------------------------------------
#@# Sphere rh Fri Oct 13 02:05:25 UTC 2023
#--------------------------------------------
#@# Surf Reg lh Fri Oct 13 02:05:25 UTC 2023

 mris_register -curv -nosulc -norot /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05/surf/lh.sphere.reg /opt/freesurfer/average/lh.folding.atlas.acfb40.noaparc.i12.2016-08-02.tif ../surf/lh.sphere.reg 


 ln -sf lh.sphere.reg lh.fsaverage.sphere.reg 

#--------------------------------------------
#@# Surf Reg rh Fri Oct 13 02:08:58 UTC 2023

 mris_register -curv -nosulc -norot /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05/surf/rh.sphere.reg /opt/freesurfer/average/rh.folding.atlas.acfb40.noaparc.i12.2016-08-02.tif ../surf/rh.sphere.reg 


 ln -sf rh.sphere.reg rh.fsaverage.sphere.reg 

#--------------------------------------------
#@# Jacobian white lh Fri Oct 13 02:12:43 UTC 2023

 mris_jacobian ../surf/lh.white.preaparc ../surf/lh.sphere.reg ../surf/lh.jacobian_white 

#--------------------------------------------
#@# Jacobian white rh Fri Oct 13 02:12:45 UTC 2023

 mris_jacobian ../surf/rh.white.preaparc ../surf/rh.sphere.reg ../surf/rh.jacobian_white 

#--------------------------------------------
#@# AvgCurv lh Fri Oct 13 02:12:47 UTC 2023

 mrisp_paint -a 5 /opt/freesurfer/average/lh.folding.atlas.acfb40.noaparc.i12.2016-08-02.tif#6 ../surf/lh.sphere.reg ../surf/lh.avg_curv 

#--------------------------------------------
#@# AvgCurv rh Fri Oct 13 02:12:48 UTC 2023

 mrisp_paint -a 5 /opt/freesurfer/average/rh.folding.atlas.acfb40.noaparc.i12.2016-08-02.tif#6 ../surf/rh.sphere.reg ../surf/rh.avg_curv 

#-----------------------------------------
#@# Cortical Parc lh Fri Oct 13 02:12:50 UTC 2023

 mris_ca_label -l ../label/lh.cortex.label -aseg ../mri/aseg.presurf.mgz -seed 1234 -long -R /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05/label/lh.aparc.annot sub-05_ses-013.long.sub-05 lh ../surf/lh.sphere.reg /opt/freesurfer/average/lh.DKaparc.atlas.acfb40.noaparc.i12.2016-08-02.gcs ../label/lh.aparc.annot 

#-----------------------------------------
#@# Cortical Parc rh Fri Oct 13 02:13:08 UTC 2023

 mris_ca_label -l ../label/rh.cortex.label -aseg ../mri/aseg.presurf.mgz -seed 1234 -long -R /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05/label/rh.aparc.annot sub-05_ses-013.long.sub-05 rh ../surf/rh.sphere.reg /opt/freesurfer/average/rh.DKaparc.atlas.acfb40.noaparc.i12.2016-08-02.gcs ../label/rh.aparc.annot 

#--------------------------------------------
#@# WhiteSurfs lh Fri Oct 13 02:13:27 UTC 2023
cd /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/mri
mris_place_surface --adgws-in ../surf/autodet.gw.stats.lh.dat --seg aseg.presurf.mgz --threads 4 --wm wm.mgz --invol brain.finalsurfs.mgz --lh --i ../surf/lh.orig_white --o ../surf/lh.white --white --nsmooth 0 --rip-label ../label/lh.cortex.label --rip-bg --rip-surf ../surf/lh.orig_white --aparc ../label/lh.aparc.annot --max-cbv-dist 3.5
#--------------------------------------------
#@# WhiteSurfs rh Fri Oct 13 02:17:49 UTC 2023
cd /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/mri
mris_place_surface --adgws-in ../surf/autodet.gw.stats.rh.dat --seg aseg.presurf.mgz --threads 4 --wm wm.mgz --invol brain.finalsurfs.mgz --rh --i ../surf/rh.orig_white --o ../surf/rh.white --white --nsmooth 0 --rip-label ../label/rh.cortex.label --rip-bg --rip-surf ../surf/rh.orig_white --aparc ../label/rh.aparc.annot --max-cbv-dist 3.5
#--------------------------------------------
#@# T1PialSurf lh Fri Oct 13 02:22:18 UTC 2023
cd /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/mri
mris_place_surface --adgws-in ../surf/autodet.gw.stats.lh.dat --seg aseg.presurf.mgz --threads 4 --wm wm.mgz --invol brain.finalsurfs.mgz --lh --i ../surf/lh.orig_pial --o ../surf/lh.pial.T1 --pial --nsmooth 0 --rip-label ../label/lh.cortex+hipamyg.label --pin-medial-wall ../label/lh.cortex.label --aparc ../label/lh.aparc.annot --repulse-surf ../surf/lh.white --white-surf ../surf/lh.white --max-cbv-dist 3.5 --blend-surf .25 ../surf/lh.white
#--------------------------------------------
#@# T1PialSurf rh Fri Oct 13 02:27:20 UTC 2023
cd /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/mri
mris_place_surface --adgws-in ../surf/autodet.gw.stats.rh.dat --seg aseg.presurf.mgz --threads 4 --wm wm.mgz --invol brain.finalsurfs.mgz --rh --i ../surf/rh.orig_pial --o ../surf/rh.pial.T1 --pial --nsmooth 0 --rip-label ../label/rh.cortex+hipamyg.label --pin-medial-wall ../label/rh.cortex.label --aparc ../label/rh.aparc.annot --repulse-surf ../surf/rh.white --white-surf ../surf/rh.white --max-cbv-dist 3.5 --blend-surf .25 ../surf/rh.white
#@# white curv lh Fri Oct 13 02:32:28 UTC 2023
cd /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/mri
mris_place_surface --curv-map ../surf/lh.white 2 10 ../surf/lh.curv
#@# white area lh Fri Oct 13 02:32:32 UTC 2023
cd /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/mri
mris_place_surface --area-map ../surf/lh.white ../surf/lh.area
#@# pial curv lh Fri Oct 13 02:32:33 UTC 2023
cd /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/mri
mris_place_surface --curv-map ../surf/lh.pial 2 10 ../surf/lh.curv.pial
#@# pial area lh Fri Oct 13 02:32:37 UTC 2023
cd /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/mri
mris_place_surface --area-map ../surf/lh.pial ../surf/lh.area.pial
#@# thickness lh Fri Oct 13 02:32:39 UTC 2023
cd /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/mri
mris_place_surface --thickness ../surf/lh.white ../surf/lh.pial 20 5 ../surf/lh.thickness
#@# area and vertex vol lh Fri Oct 13 02:33:46 UTC 2023
cd /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/mri
mris_place_surface --thickness ../surf/lh.white ../surf/lh.pial 20 5 ../surf/lh.thickness
#@# white curv rh Fri Oct 13 02:33:49 UTC 2023
cd /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/mri
mris_place_surface --curv-map ../surf/rh.white 2 10 ../surf/rh.curv
#@# white area rh Fri Oct 13 02:33:53 UTC 2023
cd /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/mri
mris_place_surface --area-map ../surf/rh.white ../surf/rh.area
#@# pial curv rh Fri Oct 13 02:33:55 UTC 2023
cd /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/mri
mris_place_surface --curv-map ../surf/rh.pial 2 10 ../surf/rh.curv.pial
#@# pial area rh Fri Oct 13 02:33:58 UTC 2023
cd /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/mri
mris_place_surface --area-map ../surf/rh.pial ../surf/rh.area.pial
#@# thickness rh Fri Oct 13 02:34:00 UTC 2023
cd /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/mri
mris_place_surface --thickness ../surf/rh.white ../surf/rh.pial 20 5 ../surf/rh.thickness
#@# area and vertex vol rh Fri Oct 13 02:35:09 UTC 2023
cd /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/mri
mris_place_surface --thickness ../surf/rh.white ../surf/rh.pial 20 5 ../surf/rh.thickness

#-----------------------------------------
#@# Curvature Stats lh Fri Oct 13 02:35:12 UTC 2023

 mris_curvature_stats -m --writeCurvatureFiles -G -o ../stats/lh.curv.stats -F smoothwm sub-05_ses-013.long.sub-05 lh curv sulc 


#-----------------------------------------
#@# Curvature Stats rh Fri Oct 13 02:35:18 UTC 2023

 mris_curvature_stats -m --writeCurvatureFiles -G -o ../stats/rh.curv.stats -F smoothwm sub-05_ses-013.long.sub-05 rh curv sulc 

#--------------------------------------------
#@# Cortical ribbon mask Fri Oct 13 02:35:24 UTC 2023

 mris_volmask --aseg_name aseg.presurf --label_left_white 2 --label_left_ribbon 3 --label_right_white 41 --label_right_ribbon 42 --save_ribbon sub-05_ses-013.long.sub-05 

#-----------------------------------------
#@# Cortical Parc 2 lh Fri Oct 13 02:54:58 UTC 2023

 mris_ca_label -l ../label/lh.cortex.label -aseg ../mri/aseg.presurf.mgz -seed 1234 -long -R /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05/label/lh.aparc.a2009s.annot sub-05_ses-013.long.sub-05 lh ../surf/lh.sphere.reg /opt/freesurfer/average/lh.CDaparc.atlas.acfb40.noaparc.i12.2016-08-02.gcs ../label/lh.aparc.a2009s.annot 

#-----------------------------------------
#@# Cortical Parc 2 rh Fri Oct 13 02:55:21 UTC 2023

 mris_ca_label -l ../label/rh.cortex.label -aseg ../mri/aseg.presurf.mgz -seed 1234 -long -R /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05/label/rh.aparc.a2009s.annot sub-05_ses-013.long.sub-05 rh ../surf/rh.sphere.reg /opt/freesurfer/average/rh.CDaparc.atlas.acfb40.noaparc.i12.2016-08-02.gcs ../label/rh.aparc.a2009s.annot 

#-----------------------------------------
#@# Cortical Parc 3 lh Fri Oct 13 02:55:44 UTC 2023

 mris_ca_label -l ../label/lh.cortex.label -aseg ../mri/aseg.presurf.mgz -seed 1234 -long -R /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05/label/lh.aparc.DKTatlas.annot sub-05_ses-013.long.sub-05 lh ../surf/lh.sphere.reg /opt/freesurfer/average/lh.DKTaparc.atlas.acfb40.noaparc.i12.2016-08-02.gcs ../label/lh.aparc.DKTatlas.annot 

#-----------------------------------------
#@# Cortical Parc 3 rh Fri Oct 13 02:56:04 UTC 2023

 mris_ca_label -l ../label/rh.cortex.label -aseg ../mri/aseg.presurf.mgz -seed 1234 -long -R /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05/label/rh.aparc.DKTatlas.annot sub-05_ses-013.long.sub-05 rh ../surf/rh.sphere.reg /opt/freesurfer/average/rh.DKTaparc.atlas.acfb40.noaparc.i12.2016-08-02.gcs ../label/rh.aparc.DKTatlas.annot 

#-----------------------------------------
#@# WM/GM Contrast lh Fri Oct 13 02:56:23 UTC 2023

 pctsurfcon --s sub-05_ses-013.long.sub-05 --lh-only 

#-----------------------------------------
#@# WM/GM Contrast rh Fri Oct 13 02:56:31 UTC 2023

 pctsurfcon --s sub-05_ses-013.long.sub-05 --rh-only 

#-----------------------------------------
#@# Relabel Hypointensities Fri Oct 13 02:56:40 UTC 2023

 mri_relabel_hypointensities aseg.presurf.mgz ../surf aseg.presurf.hypos.mgz 

#-----------------------------------------
#@# APas-to-ASeg Fri Oct 13 02:57:22 UTC 2023

 mri_surf2volseg --o aseg.mgz --i aseg.presurf.hypos.mgz --fix-presurf-with-ribbon /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/mri/ribbon.mgz --threads 4 --lh-cortex-mask /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/label/lh.cortex.label --lh-white /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/surf/lh.white --lh-pial /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/surf/lh.pial --rh-cortex-mask /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/label/rh.cortex.label --rh-white /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/surf/rh.white --rh-pial /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/surf/rh.pial 


 mri_brainvol_stats --subject sub-05_ses-013.long.sub-05 

#-----------------------------------------
#@# AParc-to-ASeg aparc Fri Oct 13 02:57:52 UTC 2023

 mri_surf2volseg --o aparc+aseg.mgz --label-cortex --i aseg.mgz --threads 4 --lh-annot /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/label/lh.aparc.annot 1000 --lh-cortex-mask /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/label/lh.cortex.label --lh-white /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/surf/lh.white --lh-pial /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/surf/lh.pial --rh-annot /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/label/rh.aparc.annot 2000 --rh-cortex-mask /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/label/rh.cortex.label --rh-white /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/surf/rh.white --rh-pial /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/surf/rh.pial 

#-----------------------------------------
#@# AParc-to-ASeg aparc.a2009s Fri Oct 13 03:02:19 UTC 2023

 mri_surf2volseg --o aparc.a2009s+aseg.mgz --label-cortex --i aseg.mgz --threads 4 --lh-annot /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/label/lh.aparc.a2009s.annot 11100 --lh-cortex-mask /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/label/lh.cortex.label --lh-white /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/surf/lh.white --lh-pial /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/surf/lh.pial --rh-annot /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/label/rh.aparc.a2009s.annot 12100 --rh-cortex-mask /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/label/rh.cortex.label --rh-white /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/surf/rh.white --rh-pial /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/surf/rh.pial 

#-----------------------------------------
#@# AParc-to-ASeg aparc.DKTatlas Fri Oct 13 03:06:37 UTC 2023

 mri_surf2volseg --o aparc.DKTatlas+aseg.mgz --label-cortex --i aseg.mgz --threads 4 --lh-annot /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/label/lh.aparc.DKTatlas.annot 1000 --lh-cortex-mask /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/label/lh.cortex.label --lh-white /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/surf/lh.white --lh-pial /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/surf/lh.pial --rh-annot /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/label/rh.aparc.DKTatlas.annot 2000 --rh-cortex-mask /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/label/rh.cortex.label --rh-white /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/surf/rh.white --rh-pial /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/surf/rh.pial 

#-----------------------------------------
#@# WMParc Fri Oct 13 03:11:00 UTC 2023

 mri_surf2volseg --o wmparc.mgz --label-wm --i aparc+aseg.mgz --threads 4 --lh-annot /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/label/lh.aparc.annot 3000 --lh-cortex-mask /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/label/lh.cortex.label --lh-white /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/surf/lh.white --lh-pial /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/surf/lh.pial --rh-annot /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/label/rh.aparc.annot 4000 --rh-cortex-mask /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/label/rh.cortex.label --rh-white /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/surf/rh.white --rh-pial /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/sub-05_ses-013.long.sub-05/surf/rh.pial 


 mri_segstats --seed 1234 --seg mri/wmparc.mgz --sum stats/wmparc.stats --pv mri/norm.mgz --excludeid 0 --brainmask mri/brainmask.mgz --in mri/norm.mgz --in-intensity-name norm --in-intensity-units MR --subject sub-05_ses-013.long.sub-05 --surf-wm-vol --ctab /opt/freesurfer/WMParcStatsLUT.txt --etiv 

#-----------------------------------------
#@# Parcellation Stats lh Fri Oct 13 03:18:08 UTC 2023

 mris_anatomical_stats -th3 -mgz -cortex ../label/lh.cortex.label -f ../stats/lh.aparc.stats -b -a ../label/lh.aparc.annot -c ../label/aparc.annot.ctab sub-05_ses-013.long.sub-05 lh white 


 mris_anatomical_stats -th3 -mgz -cortex ../label/lh.cortex.label -f ../stats/lh.aparc.pial.stats -b -a ../label/lh.aparc.annot -c ../label/aparc.annot.ctab sub-05_ses-013.long.sub-05 lh pial 

#-----------------------------------------
#@# Parcellation Stats rh Fri Oct 13 03:19:30 UTC 2023

 mris_anatomical_stats -th3 -mgz -cortex ../label/rh.cortex.label -f ../stats/rh.aparc.stats -b -a ../label/rh.aparc.annot -c ../label/aparc.annot.ctab sub-05_ses-013.long.sub-05 rh white 


 mris_anatomical_stats -th3 -mgz -cortex ../label/rh.cortex.label -f ../stats/rh.aparc.pial.stats -b -a ../label/rh.aparc.annot -c ../label/aparc.annot.ctab sub-05_ses-013.long.sub-05 rh pial 

#-----------------------------------------
#@# Parcellation Stats 2 lh Fri Oct 13 03:20:55 UTC 2023

 mris_anatomical_stats -th3 -mgz -cortex ../label/lh.cortex.label -f ../stats/lh.aparc.a2009s.stats -b -a ../label/lh.aparc.a2009s.annot -c ../label/aparc.annot.a2009s.ctab sub-05_ses-013.long.sub-05 lh white 

#-----------------------------------------
#@# Parcellation Stats 2 rh Fri Oct 13 03:21:40 UTC 2023

 mris_anatomical_stats -th3 -mgz -cortex ../label/rh.cortex.label -f ../stats/rh.aparc.a2009s.stats -b -a ../label/rh.aparc.a2009s.annot -c ../label/aparc.annot.a2009s.ctab sub-05_ses-013.long.sub-05 rh white 

#-----------------------------------------
#@# Parcellation Stats 3 lh Fri Oct 13 03:22:24 UTC 2023

 mris_anatomical_stats -th3 -mgz -cortex ../label/lh.cortex.label -f ../stats/lh.aparc.DKTatlas.stats -b -a ../label/lh.aparc.DKTatlas.annot -c ../label/aparc.annot.DKTatlas.ctab sub-05_ses-013.long.sub-05 lh white 

#-----------------------------------------
#@# Parcellation Stats 3 rh Fri Oct 13 03:23:05 UTC 2023

 mris_anatomical_stats -th3 -mgz -cortex ../label/rh.cortex.label -f ../stats/rh.aparc.DKTatlas.stats -b -a ../label/rh.aparc.DKTatlas.annot -c ../label/aparc.annot.DKTatlas.ctab sub-05_ses-013.long.sub-05 rh white 

#--------------------------------------------
#@# ASeg Stats Fri Oct 13 03:23:47 UTC 2023

 mri_segstats --seed 1234 --seg mri/aseg.mgz --sum stats/aseg.stats --pv mri/norm.mgz --empty --brainmask mri/brainmask.mgz --brain-vol-from-seg --excludeid 0 --excl-ctxgmwm --supratent --subcortgray --in mri/norm.mgz --in-intensity-name norm --in-intensity-units MR --etiv --surf-wm-vol --surf-ctx-vol --totalgray --ctab /opt/freesurfer/ASegStatsLUT.txt --subject sub-05_ses-013.long.sub-05 

#--------------------------------------------
#@# BA_exvivo Labels lh Fri Oct 13 03:25:31 UTC 2023

 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/lh.BA1_exvivo.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./lh.BA1_exvivo.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/lh.BA2_exvivo.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./lh.BA2_exvivo.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/lh.BA3a_exvivo.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./lh.BA3a_exvivo.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/lh.BA3b_exvivo.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./lh.BA3b_exvivo.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/lh.BA4a_exvivo.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./lh.BA4a_exvivo.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/lh.BA4p_exvivo.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./lh.BA4p_exvivo.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/lh.BA6_exvivo.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./lh.BA6_exvivo.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/lh.BA44_exvivo.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./lh.BA44_exvivo.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/lh.BA45_exvivo.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./lh.BA45_exvivo.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/lh.V1_exvivo.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./lh.V1_exvivo.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/lh.V2_exvivo.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./lh.V2_exvivo.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/lh.MT_exvivo.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./lh.MT_exvivo.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/lh.entorhinal_exvivo.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./lh.entorhinal_exvivo.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/lh.perirhinal_exvivo.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./lh.perirhinal_exvivo.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/lh.FG1.mpm.vpnl.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./lh.FG1.mpm.vpnl.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/lh.FG2.mpm.vpnl.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./lh.FG2.mpm.vpnl.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/lh.FG3.mpm.vpnl.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./lh.FG3.mpm.vpnl.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/lh.FG4.mpm.vpnl.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./lh.FG4.mpm.vpnl.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/lh.hOc1.mpm.vpnl.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./lh.hOc1.mpm.vpnl.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/lh.hOc2.mpm.vpnl.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./lh.hOc2.mpm.vpnl.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/lh.hOc3v.mpm.vpnl.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./lh.hOc3v.mpm.vpnl.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/lh.hOc4v.mpm.vpnl.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./lh.hOc4v.mpm.vpnl.label --hemi lh --regmethod surface 


 mris_label2annot --s sub-05_ses-013.long.sub-05 --ctab /opt/freesurfer/average/colortable_vpnl.txt --hemi lh --a mpm.vpnl --maxstatwinner --noverbose --l lh.FG1.mpm.vpnl.label --l lh.FG2.mpm.vpnl.label --l lh.FG3.mpm.vpnl.label --l lh.FG4.mpm.vpnl.label --l lh.hOc1.mpm.vpnl.label --l lh.hOc2.mpm.vpnl.label --l lh.hOc3v.mpm.vpnl.label --l lh.hOc4v.mpm.vpnl.label 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/lh.BA1_exvivo.thresh.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./lh.BA1_exvivo.thresh.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/lh.BA2_exvivo.thresh.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./lh.BA2_exvivo.thresh.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/lh.BA3a_exvivo.thresh.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./lh.BA3a_exvivo.thresh.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/lh.BA3b_exvivo.thresh.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./lh.BA3b_exvivo.thresh.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/lh.BA4a_exvivo.thresh.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./lh.BA4a_exvivo.thresh.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/lh.BA4p_exvivo.thresh.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./lh.BA4p_exvivo.thresh.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/lh.BA6_exvivo.thresh.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./lh.BA6_exvivo.thresh.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/lh.BA44_exvivo.thresh.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./lh.BA44_exvivo.thresh.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/lh.BA45_exvivo.thresh.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./lh.BA45_exvivo.thresh.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/lh.V1_exvivo.thresh.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./lh.V1_exvivo.thresh.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/lh.V2_exvivo.thresh.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./lh.V2_exvivo.thresh.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/lh.MT_exvivo.thresh.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./lh.MT_exvivo.thresh.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/lh.entorhinal_exvivo.thresh.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./lh.entorhinal_exvivo.thresh.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/lh.perirhinal_exvivo.thresh.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./lh.perirhinal_exvivo.thresh.label --hemi lh --regmethod surface 


 mris_label2annot --s sub-05_ses-013.long.sub-05 --hemi lh --ctab /opt/freesurfer/average/colortable_BA.txt --l lh.BA1_exvivo.label --l lh.BA2_exvivo.label --l lh.BA3a_exvivo.label --l lh.BA3b_exvivo.label --l lh.BA4a_exvivo.label --l lh.BA4p_exvivo.label --l lh.BA6_exvivo.label --l lh.BA44_exvivo.label --l lh.BA45_exvivo.label --l lh.V1_exvivo.label --l lh.V2_exvivo.label --l lh.MT_exvivo.label --l lh.perirhinal_exvivo.label --l lh.entorhinal_exvivo.label --a BA_exvivo --maxstatwinner --noverbose 


 mris_label2annot --s sub-05_ses-013.long.sub-05 --hemi lh --ctab /opt/freesurfer/average/colortable_BA.txt --l lh.BA1_exvivo.thresh.label --l lh.BA2_exvivo.thresh.label --l lh.BA3a_exvivo.thresh.label --l lh.BA3b_exvivo.thresh.label --l lh.BA4a_exvivo.thresh.label --l lh.BA4p_exvivo.thresh.label --l lh.BA6_exvivo.thresh.label --l lh.BA44_exvivo.thresh.label --l lh.BA45_exvivo.thresh.label --l lh.V1_exvivo.thresh.label --l lh.V2_exvivo.thresh.label --l lh.MT_exvivo.thresh.label --l lh.perirhinal_exvivo.thresh.label --l lh.entorhinal_exvivo.thresh.label --a BA_exvivo.thresh --maxstatwinner --noverbose 


 mris_anatomical_stats -th3 -mgz -f ../stats/lh.BA_exvivo.stats -b -a ./lh.BA_exvivo.annot -c ./BA_exvivo.ctab sub-05_ses-013.long.sub-05 lh white 


 mris_anatomical_stats -th3 -mgz -f ../stats/lh.BA_exvivo.thresh.stats -b -a ./lh.BA_exvivo.thresh.annot -c ./BA_exvivo.thresh.ctab sub-05_ses-013.long.sub-05 lh white 

#--------------------------------------------
#@# BA_exvivo Labels rh Fri Oct 13 03:31:39 UTC 2023

 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/rh.BA1_exvivo.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./rh.BA1_exvivo.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/rh.BA2_exvivo.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./rh.BA2_exvivo.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/rh.BA3a_exvivo.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./rh.BA3a_exvivo.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/rh.BA3b_exvivo.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./rh.BA3b_exvivo.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/rh.BA4a_exvivo.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./rh.BA4a_exvivo.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/rh.BA4p_exvivo.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./rh.BA4p_exvivo.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/rh.BA6_exvivo.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./rh.BA6_exvivo.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/rh.BA44_exvivo.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./rh.BA44_exvivo.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/rh.BA45_exvivo.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./rh.BA45_exvivo.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/rh.V1_exvivo.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./rh.V1_exvivo.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/rh.V2_exvivo.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./rh.V2_exvivo.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/rh.MT_exvivo.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./rh.MT_exvivo.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/rh.entorhinal_exvivo.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./rh.entorhinal_exvivo.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/rh.perirhinal_exvivo.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./rh.perirhinal_exvivo.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/rh.FG1.mpm.vpnl.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./rh.FG1.mpm.vpnl.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/rh.FG2.mpm.vpnl.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./rh.FG2.mpm.vpnl.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/rh.FG3.mpm.vpnl.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./rh.FG3.mpm.vpnl.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/rh.FG4.mpm.vpnl.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./rh.FG4.mpm.vpnl.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/rh.hOc1.mpm.vpnl.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./rh.hOc1.mpm.vpnl.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/rh.hOc2.mpm.vpnl.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./rh.hOc2.mpm.vpnl.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/rh.hOc3v.mpm.vpnl.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./rh.hOc3v.mpm.vpnl.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/rh.hOc4v.mpm.vpnl.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./rh.hOc4v.mpm.vpnl.label --hemi rh --regmethod surface 


 mris_label2annot --s sub-05_ses-013.long.sub-05 --ctab /opt/freesurfer/average/colortable_vpnl.txt --hemi rh --a mpm.vpnl --maxstatwinner --noverbose --l rh.FG1.mpm.vpnl.label --l rh.FG2.mpm.vpnl.label --l rh.FG3.mpm.vpnl.label --l rh.FG4.mpm.vpnl.label --l rh.hOc1.mpm.vpnl.label --l rh.hOc2.mpm.vpnl.label --l rh.hOc3v.mpm.vpnl.label --l rh.hOc4v.mpm.vpnl.label 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/rh.BA1_exvivo.thresh.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./rh.BA1_exvivo.thresh.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/rh.BA2_exvivo.thresh.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./rh.BA2_exvivo.thresh.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/rh.BA3a_exvivo.thresh.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./rh.BA3a_exvivo.thresh.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/rh.BA3b_exvivo.thresh.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./rh.BA3b_exvivo.thresh.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/rh.BA4a_exvivo.thresh.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./rh.BA4a_exvivo.thresh.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/rh.BA4p_exvivo.thresh.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./rh.BA4p_exvivo.thresh.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/rh.BA6_exvivo.thresh.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./rh.BA6_exvivo.thresh.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/rh.BA44_exvivo.thresh.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./rh.BA44_exvivo.thresh.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/rh.BA45_exvivo.thresh.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./rh.BA45_exvivo.thresh.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/rh.V1_exvivo.thresh.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./rh.V1_exvivo.thresh.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/rh.V2_exvivo.thresh.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./rh.V2_exvivo.thresh.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/rh.MT_exvivo.thresh.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./rh.MT_exvivo.thresh.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/rh.entorhinal_exvivo.thresh.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./rh.entorhinal_exvivo.thresh.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41537206.0/freesurfer_longitudinal_autoreconall_sub05.job/fsaverage/label/rh.perirhinal_exvivo.thresh.label --trgsubject sub-05_ses-013.long.sub-05 --trglabel ./rh.perirhinal_exvivo.thresh.label --hemi rh --regmethod surface 


 mris_label2annot --s sub-05_ses-013.long.sub-05 --hemi rh --ctab /opt/freesurfer/average/colortable_BA.txt --l rh.BA1_exvivo.label --l rh.BA2_exvivo.label --l rh.BA3a_exvivo.label --l rh.BA3b_exvivo.label --l rh.BA4a_exvivo.label --l rh.BA4p_exvivo.label --l rh.BA6_exvivo.label --l rh.BA44_exvivo.label --l rh.BA45_exvivo.label --l rh.V1_exvivo.label --l rh.V2_exvivo.label --l rh.MT_exvivo.label --l rh.perirhinal_exvivo.label --l rh.entorhinal_exvivo.label --a BA_exvivo --maxstatwinner --noverbose 


 mris_label2annot --s sub-05_ses-013.long.sub-05 --hemi rh --ctab /opt/freesurfer/average/colortable_BA.txt --l rh.BA1_exvivo.thresh.label --l rh.BA2_exvivo.thresh.label --l rh.BA3a_exvivo.thresh.label --l rh.BA3b_exvivo.thresh.label --l rh.BA4a_exvivo.thresh.label --l rh.BA4p_exvivo.thresh.label --l rh.BA6_exvivo.thresh.label --l rh.BA44_exvivo.thresh.label --l rh.BA45_exvivo.thresh.label --l rh.V1_exvivo.thresh.label --l rh.V2_exvivo.thresh.label --l rh.MT_exvivo.thresh.label --l rh.perirhinal_exvivo.thresh.label --l rh.entorhinal_exvivo.thresh.label --a BA_exvivo.thresh --maxstatwinner --noverbose 


 mris_anatomical_stats -th3 -mgz -f ../stats/rh.BA_exvivo.stats -b -a ./rh.BA_exvivo.annot -c ./BA_exvivo.ctab sub-05_ses-013.long.sub-05 rh white 


 mris_anatomical_stats -th3 -mgz -f ../stats/rh.BA_exvivo.thresh.stats -b -a ./rh.BA_exvivo.thresh.annot -c ./BA_exvivo.thresh.ctab sub-05_ses-013.long.sub-05 rh white 

