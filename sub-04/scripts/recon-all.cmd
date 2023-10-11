

#---------------------------------
# New invocation of recon-all Tue Oct 10 19:39:56 UTC 2023 
#--------------------------------------------
#@# Longitudinal Base Subject Creation Tue Oct 10 19:39:58 UTC 2023
#--------------------------------------------
#@# Longitudinal Base Subject Creation Tue Oct 10 19:39:58 UTC 2023

 mri_diff --notallow-pix --notallow-geo /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04_ses-002/mri/rawavg.mgz /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04_ses-004/mri/rawavg.mgz 


 mri_diff --notallow-pix --notallow-geo /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04_ses-003/mri/rawavg.mgz /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04_ses-004/mri/rawavg.mgz 


 mri_diff --notallow-pix --notallow-geo /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04_ses-005/mri/rawavg.mgz /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04_ses-004/mri/rawavg.mgz 


 mri_diff --notallow-pix --notallow-geo /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04_ses-001/mri/rawavg.mgz /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04_ses-004/mri/rawavg.mgz 


 mri_robust_template --mov /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04_ses-004/mri/norm.mgz /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04_ses-002/mri/norm.mgz /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04_ses-003/mri/norm.mgz /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04_ses-005/mri/norm.mgz /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04_ses-001/mri/norm.mgz --lta /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri/transforms/sub-04_ses-004_to_sub-04.lta /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri/transforms/sub-04_ses-002_to_sub-04.lta /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri/transforms/sub-04_ses-003_to_sub-04.lta /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri/transforms/sub-04_ses-005_to_sub-04.lta /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri/transforms/sub-04_ses-001_to_sub-04.lta --template /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri/norm_template.mgz --average 1 --sat 4.685 


 mri_robust_template --mov /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04_ses-004/mri/orig.mgz /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04_ses-002/mri/orig.mgz /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04_ses-003/mri/orig.mgz /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04_ses-005/mri/orig.mgz /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04_ses-001/mri/orig.mgz --average 1 --ixforms /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri/transforms/sub-04_ses-004_to_sub-04.lta /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri/transforms/sub-04_ses-002_to_sub-04.lta /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri/transforms/sub-04_ses-003_to_sub-04.lta /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri/transforms/sub-04_ses-005_to_sub-04.lta /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri/transforms/sub-04_ses-001_to_sub-04.lta --noit --template /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri/orig.mgz 


 mri_concatenate_lta -invert1 sub-04_ses-004_to_sub-04.lta identity.nofile sub-04_to_sub-04_ses-004.lta 


 mri_concatenate_lta -invert1 sub-04_ses-002_to_sub-04.lta identity.nofile sub-04_to_sub-04_ses-002.lta 


 mri_concatenate_lta -invert1 sub-04_ses-003_to_sub-04.lta identity.nofile sub-04_to_sub-04_ses-003.lta 


 mri_concatenate_lta -invert1 sub-04_ses-005_to_sub-04.lta identity.nofile sub-04_to_sub-04_ses-005.lta 


 mri_concatenate_lta -invert1 sub-04_ses-001_to_sub-04.lta identity.nofile sub-04_to_sub-04_ses-001.lta 


 mri_robust_template --mov /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04_ses-004/mri/brainmask.mgz /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04_ses-002/mri/brainmask.mgz /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04_ses-003/mri/brainmask.mgz /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04_ses-005/mri/brainmask.mgz /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04_ses-001/mri/brainmask.mgz --average 0 --ixforms /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri/transforms/sub-04_ses-004_to_sub-04.lta /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri/transforms/sub-04_ses-002_to_sub-04.lta /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri/transforms/sub-04_ses-003_to_sub-04.lta /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri/transforms/sub-04_ses-005_to_sub-04.lta /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri/transforms/sub-04_ses-001_to_sub-04.lta --noit --finalnearest --template /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri/brainmask_template.mgz 

#--------------------------------------------
#@# MotionCor Tue Oct 10 19:51:04 UTC 2023
#--------------------------------------------
#@# Talairach Tue Oct 10 19:51:04 UTC 2023

 mri_nu_correct.mni --no-rescale --i orig.mgz --o orig_nu.mgz --ants-n4 --n 1 --proto-iters 1000 --distance 50 


 talairach_avi --i orig_nu.mgz --xfm transforms/talairach.auto.xfm 

talairach_avi log file is transforms/talairach_avi.log...

 cp transforms/talairach.auto.xfm transforms/talairach.xfm 

lta_convert --src orig.mgz --trg /opt/freesurfer/average/mni305.cor.mgz --inxfm transforms/talairach.xfm --outlta transforms/talairach.xfm.lta --subject fsaverage --ltavox2vox
#--------------------------------------------
#@# Talairach Failure Detection Tue Oct 10 20:00:38 UTC 2023

 talairach_afd -T 0.005 -xfm transforms/talairach.xfm 


 awk -f /opt/freesurfer/bin/extract_talairach_avi_QA.awk /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri/transforms/talairach_avi.log 


 tal_QC_AZS /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri/transforms/talairach_avi.log 

#--------------------------------------------
#@# Nu Intensity Correction Tue Oct 10 20:00:39 UTC 2023

 mri_nu_correct.mni --i orig.mgz --o nu.mgz --uchar transforms/talairach.xfm --n 2 --ants-n4 


 mri_add_xform_to_header -c /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri/transforms/talairach.xfm nu.mgz nu.mgz 

#--------------------------------------------
#@# Intensity Normalization Tue Oct 10 20:10:17 UTC 2023

 mri_normalize -g 1 -seed 1234 -mprage -W ctrl_vol.mgz bias_vol.mgz nu.mgz T1.mgz 

#--------------------------------------------
#@# Skull Stripping Tue Oct 10 20:17:37 UTC 2023

 mri_mask -keep_mask_deletion_edits T1.mgz brainmask_template.mgz brainmask.auto.mgz 


 mri_mask -transfer 255 -keep_mask_deletion_edits brainmask.auto.mgz brainmask_template.mgz brainmask.auto.mgz 


 cp brainmask.auto.mgz brainmask.mgz 

#-------------------------------------
#@# EM Registration Tue Oct 10 20:17:44 UTC 2023

 mri_em_register -mask brainmask.mgz norm_template.mgz /opt/freesurfer/average/RB_all_2020-01-02.gca transforms/talairach.lta 

#--------------------------------------
#@# CA Normalize Tue Oct 10 20:22:37 UTC 2023

 mri_ca_normalize -c ctrl_pts.mgz -mask brainmask.mgz norm_template.mgz /opt/freesurfer/average/RB_all_2020-01-02.gca transforms/talairach.lta norm.mgz 

#--------------------------------------
#@# CA Reg Tue Oct 10 20:25:45 UTC 2023

 mri_ca_register -nobigventricles -T transforms/talairach.lta -align-after -mask brainmask.mgz norm.mgz /opt/freesurfer/average/RB_all_2020-01-02.gca transforms/talairach.m3z 

#--------------------------------------
#@# SubCort Seg Tue Oct 10 21:55:38 UTC 2023

 mri_ca_label -relabel_unlikely 9 .3 -prior 0.5 -align norm.mgz transforms/talairach.m3z /opt/freesurfer/average/RB_all_2020-01-02.gca aseg.auto_noCCseg.mgz 

#--------------------------------------
#@# CC Seg Tue Oct 10 23:32:10 UTC 2023

 mri_cc -aseg aseg.auto_noCCseg.mgz -o aseg.auto.mgz -lta /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri/transforms/cc_up.lta sub-04 

#--------------------------------------
#@# Merge ASeg Tue Oct 10 23:34:21 UTC 2023

 cp aseg.auto.mgz aseg.presurf.mgz 

#--------------------------------------------
#@# Intensity Normalization2 Tue Oct 10 23:34:21 UTC 2023

 mri_normalize -seed 1234 -mprage -aseg aseg.presurf.mgz -mask brainmask.mgz norm.mgz brain.mgz 

#--------------------------------------------
#@# Mask BFS Tue Oct 10 23:41:40 UTC 2023

 mri_mask -T 5 brain.mgz brainmask.mgz brain.finalsurfs.mgz 

#--------------------------------------------
#@# WM Segmentation Tue Oct 10 23:41:43 UTC 2023

 AntsDenoiseImageFs -i brain.mgz -o antsdn.brain.mgz 


 mri_segment -wsizemm 13 -mprage antsdn.brain.mgz wm.seg.mgz 


 mri_edit_wm_with_aseg -keep-in wm.seg.mgz brain.mgz aseg.presurf.mgz wm.asegedit.mgz 


 mri_pretess wm.asegedit.mgz wm norm.mgz wm.mgz 

#--------------------------------------------
#@# Fill Tue Oct 10 23:49:40 UTC 2023

 mri_fill -a ../scripts/ponscc.cut.log -xform transforms/talairach.lta -segmentation aseg.presurf.mgz -ctab /opt/freesurfer/SubCorticalMassLUT.txt wm.mgz filled.mgz 

 cp filled.mgz filled.auto.mgz
#--------------------------------------------
#@# Tessellate lh Tue Oct 10 23:52:52 UTC 2023

 mri_pretess ../mri/filled.mgz 255 ../mri/norm.mgz ../mri/filled-pretess255.mgz 


 mri_tessellate ../mri/filled-pretess255.mgz 255 ../surf/lh.orig.nofix 


 rm -f ../mri/filled-pretess255.mgz 


 mris_extract_main_component ../surf/lh.orig.nofix ../surf/lh.orig.nofix 

#--------------------------------------------
#@# Tessellate rh Tue Oct 10 23:53:01 UTC 2023

 mri_pretess ../mri/filled.mgz 127 ../mri/norm.mgz ../mri/filled-pretess127.mgz 


 mri_tessellate ../mri/filled-pretess127.mgz 127 ../surf/rh.orig.nofix 


 rm -f ../mri/filled-pretess127.mgz 


 mris_extract_main_component ../surf/rh.orig.nofix ../surf/rh.orig.nofix 

#--------------------------------------------
#@# Smooth1 lh Tue Oct 10 23:53:11 UTC 2023

 mris_smooth -nw -seed 1234 ../surf/lh.orig.nofix ../surf/lh.smoothwm.nofix 

#--------------------------------------------
#@# Smooth1 rh Tue Oct 10 23:53:16 UTC 2023

 mris_smooth -nw -seed 1234 ../surf/rh.orig.nofix ../surf/rh.smoothwm.nofix 

#--------------------------------------------
#@# Inflation1 lh Tue Oct 10 23:53:22 UTC 2023

 mris_inflate -no-save-sulc ../surf/lh.smoothwm.nofix ../surf/lh.inflated.nofix 

#--------------------------------------------
#@# Inflation1 rh Tue Oct 10 23:53:46 UTC 2023

 mris_inflate -no-save-sulc ../surf/rh.smoothwm.nofix ../surf/rh.inflated.nofix 

#--------------------------------------------
#@# QSphere lh Tue Oct 10 23:54:11 UTC 2023

 mris_sphere -q -p 6 -a 128 -seed 1234 ../surf/lh.inflated.nofix ../surf/lh.qsphere.nofix 

#--------------------------------------------
#@# QSphere rh Tue Oct 10 23:56:34 UTC 2023

 mris_sphere -q -p 6 -a 128 -seed 1234 ../surf/rh.inflated.nofix ../surf/rh.qsphere.nofix 

#@# Fix Topology lh Tue Oct 10 23:58:57 UTC 2023

 mris_fix_topology -mgz -sphere qsphere.nofix -inflated inflated.nofix -orig orig.nofix -out orig.premesh -ga -seed 1234 sub-04 lh 

#@# Fix Topology rh Wed Oct 11 00:00:44 UTC 2023

 mris_fix_topology -mgz -sphere qsphere.nofix -inflated inflated.nofix -orig orig.nofix -out orig.premesh -ga -seed 1234 sub-04 rh 


 mris_euler_number ../surf/lh.orig.premesh 


 mris_euler_number ../surf/rh.orig.premesh 


 mris_remesh --remesh --iters 3 --input /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/surf/lh.orig.premesh --output /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/surf/lh.orig 


 mris_remesh --remesh --iters 3 --input /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/surf/rh.orig.premesh --output /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/surf/rh.orig 


 mris_remove_intersection ../surf/lh.orig ../surf/lh.orig 


 rm -f ../surf/lh.inflated 


 mris_remove_intersection ../surf/rh.orig ../surf/rh.orig 


 rm -f ../surf/rh.inflated 

#--------------------------------------------
#@# AutoDetGWStats lh Wed Oct 11 00:06:00 UTC 2023
cd /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri
mris_autodet_gwstats --o ../surf/autodet.gw.stats.lh.dat --i brain.finalsurfs.mgz --wm wm.mgz --surf ../surf/lh.orig.premesh
#--------------------------------------------
#@# AutoDetGWStats rh Wed Oct 11 00:06:10 UTC 2023
cd /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri
mris_autodet_gwstats --o ../surf/autodet.gw.stats.rh.dat --i brain.finalsurfs.mgz --wm wm.mgz --surf ../surf/rh.orig.premesh
#--------------------------------------------
#@# WhitePreAparc lh Wed Oct 11 00:06:20 UTC 2023
cd /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri
mris_place_surface --adgws-in ../surf/autodet.gw.stats.lh.dat --wm wm.mgz --threads 4 --invol brain.finalsurfs.mgz --lh --i ../surf/lh.orig --o ../surf/lh.white.preaparc --white --seg aseg.presurf.mgz --nsmooth 5
#--------------------------------------------
#@# WhitePreAparc rh Wed Oct 11 00:11:38 UTC 2023
cd /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri
mris_place_surface --adgws-in ../surf/autodet.gw.stats.rh.dat --wm wm.mgz --threads 4 --invol brain.finalsurfs.mgz --rh --i ../surf/rh.orig --o ../surf/rh.white.preaparc --white --seg aseg.presurf.mgz --nsmooth 5
#--------------------------------------------
#@# CortexLabel lh Wed Oct 11 00:16:53 UTC 2023
cd /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri
mri_label2label --label-cortex ../surf/lh.white.preaparc aseg.presurf.mgz 0 ../label/lh.cortex.label
#--------------------------------------------
#@# CortexLabel+HipAmyg lh Wed Oct 11 00:17:25 UTC 2023
cd /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri
mri_label2label --label-cortex ../surf/lh.white.preaparc aseg.presurf.mgz 1 ../label/lh.cortex+hipamyg.label
#--------------------------------------------
#@# CortexLabel rh Wed Oct 11 00:17:57 UTC 2023
cd /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri
mri_label2label --label-cortex ../surf/rh.white.preaparc aseg.presurf.mgz 0 ../label/rh.cortex.label
#--------------------------------------------
#@# CortexLabel+HipAmyg rh Wed Oct 11 00:18:31 UTC 2023
cd /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri
mri_label2label --label-cortex ../surf/rh.white.preaparc aseg.presurf.mgz 1 ../label/rh.cortex+hipamyg.label
#--------------------------------------------
#@# Smooth2 lh Wed Oct 11 00:19:04 UTC 2023

 mris_smooth -n 3 -nw -seed 1234 ../surf/lh.white.preaparc ../surf/lh.smoothwm 

#--------------------------------------------
#@# Smooth2 rh Wed Oct 11 00:19:10 UTC 2023

 mris_smooth -n 3 -nw -seed 1234 ../surf/rh.white.preaparc ../surf/rh.smoothwm 

#--------------------------------------------
#@# Inflation2 lh Wed Oct 11 00:19:17 UTC 2023

 mris_inflate ../surf/lh.smoothwm ../surf/lh.inflated 

#--------------------------------------------
#@# Inflation2 rh Wed Oct 11 00:19:45 UTC 2023

 mris_inflate ../surf/rh.smoothwm ../surf/rh.inflated 

#--------------------------------------------
#@# Curv .H and .K lh Wed Oct 11 00:20:13 UTC 2023

 mris_curvature -w -seed 1234 lh.white.preaparc 


 mris_curvature -seed 1234 -thresh .999 -n -a 5 -w -distances 10 10 lh.inflated 

#--------------------------------------------
#@# Curv .H and .K rh Wed Oct 11 00:21:54 UTC 2023

 mris_curvature -w -seed 1234 rh.white.preaparc 


 mris_curvature -seed 1234 -thresh .999 -n -a 5 -w -distances 10 10 rh.inflated 

#--------------------------------------------
#@# Sphere lh Wed Oct 11 00:23:36 UTC 2023

 mris_sphere -seed 1234 ../surf/lh.inflated ../surf/lh.sphere 

#--------------------------------------------
#@# Sphere rh Wed Oct 11 00:30:51 UTC 2023

 mris_sphere -seed 1234 ../surf/rh.inflated ../surf/rh.sphere 

#--------------------------------------------
#@# Surf Reg lh Wed Oct 11 00:38:13 UTC 2023

 mris_register -curv ../surf/lh.sphere /opt/freesurfer/average/lh.folding.atlas.acfb40.noaparc.i12.2016-08-02.tif ../surf/lh.sphere.reg 


 ln -sf lh.sphere.reg lh.fsaverage.sphere.reg 

#--------------------------------------------
#@# Surf Reg rh Wed Oct 11 00:49:07 UTC 2023

 mris_register -curv ../surf/rh.sphere /opt/freesurfer/average/rh.folding.atlas.acfb40.noaparc.i12.2016-08-02.tif ../surf/rh.sphere.reg 


 ln -sf rh.sphere.reg rh.fsaverage.sphere.reg 

#--------------------------------------------
#@# Jacobian white lh Wed Oct 11 01:00:24 UTC 2023

 mris_jacobian ../surf/lh.white.preaparc ../surf/lh.sphere.reg ../surf/lh.jacobian_white 

#--------------------------------------------
#@# Jacobian white rh Wed Oct 11 01:00:26 UTC 2023

 mris_jacobian ../surf/rh.white.preaparc ../surf/rh.sphere.reg ../surf/rh.jacobian_white 

#--------------------------------------------
#@# AvgCurv lh Wed Oct 11 01:00:28 UTC 2023

 mrisp_paint -a 5 /opt/freesurfer/average/lh.folding.atlas.acfb40.noaparc.i12.2016-08-02.tif#6 ../surf/lh.sphere.reg ../surf/lh.avg_curv 

#--------------------------------------------
#@# AvgCurv rh Wed Oct 11 01:00:30 UTC 2023

 mrisp_paint -a 5 /opt/freesurfer/average/rh.folding.atlas.acfb40.noaparc.i12.2016-08-02.tif#6 ../surf/rh.sphere.reg ../surf/rh.avg_curv 

#-----------------------------------------
#@# Cortical Parc lh Wed Oct 11 01:00:31 UTC 2023

 mris_ca_label -l ../label/lh.cortex.label -aseg ../mri/aseg.presurf.mgz -seed 1234 sub-04 lh ../surf/lh.sphere.reg /opt/freesurfer/average/lh.DKaparc.atlas.acfb40.noaparc.i12.2016-08-02.gcs ../label/lh.aparc.annot 

#-----------------------------------------
#@# Cortical Parc rh Wed Oct 11 01:00:53 UTC 2023

 mris_ca_label -l ../label/rh.cortex.label -aseg ../mri/aseg.presurf.mgz -seed 1234 sub-04 rh ../surf/rh.sphere.reg /opt/freesurfer/average/rh.DKaparc.atlas.acfb40.noaparc.i12.2016-08-02.gcs ../label/rh.aparc.annot 

#--------------------------------------------
#@# WhiteSurfs lh Wed Oct 11 01:01:15 UTC 2023
cd /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri
mris_place_surface --adgws-in ../surf/autodet.gw.stats.lh.dat --seg aseg.presurf.mgz --threads 4 --wm wm.mgz --invol brain.finalsurfs.mgz --lh --i ../surf/lh.white.preaparc --o ../surf/lh.white --white --nsmooth 0 --rip-label ../label/lh.cortex.label --rip-bg --rip-surf ../surf/lh.white.preaparc --aparc ../label/lh.aparc.annot
#--------------------------------------------
#@# WhiteSurfs rh Wed Oct 11 01:06:16 UTC 2023
cd /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri
mris_place_surface --adgws-in ../surf/autodet.gw.stats.rh.dat --seg aseg.presurf.mgz --threads 4 --wm wm.mgz --invol brain.finalsurfs.mgz --rh --i ../surf/rh.white.preaparc --o ../surf/rh.white --white --nsmooth 0 --rip-label ../label/rh.cortex.label --rip-bg --rip-surf ../surf/rh.white.preaparc --aparc ../label/rh.aparc.annot
#--------------------------------------------
#@# T1PialSurf lh Wed Oct 11 01:11:00 UTC 2023
cd /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri
mris_place_surface --adgws-in ../surf/autodet.gw.stats.lh.dat --seg aseg.presurf.mgz --threads 4 --wm wm.mgz --invol brain.finalsurfs.mgz --lh --i ../surf/lh.white --o ../surf/lh.pial.T1 --pial --nsmooth 0 --rip-label ../label/lh.cortex+hipamyg.label --pin-medial-wall ../label/lh.cortex.label --aparc ../label/lh.aparc.annot --repulse-surf ../surf/lh.white --white-surf ../surf/lh.white
#--------------------------------------------
#@# T1PialSurf rh Wed Oct 11 01:16:16 UTC 2023
cd /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri
mris_place_surface --adgws-in ../surf/autodet.gw.stats.rh.dat --seg aseg.presurf.mgz --threads 4 --wm wm.mgz --invol brain.finalsurfs.mgz --rh --i ../surf/rh.white --o ../surf/rh.pial.T1 --pial --nsmooth 0 --rip-label ../label/rh.cortex+hipamyg.label --pin-medial-wall ../label/rh.cortex.label --aparc ../label/rh.aparc.annot --repulse-surf ../surf/rh.white --white-surf ../surf/rh.white
#@# white curv lh Wed Oct 11 01:21:11 UTC 2023
cd /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri
mris_place_surface --curv-map ../surf/lh.white 2 10 ../surf/lh.curv
#@# white area lh Wed Oct 11 01:21:15 UTC 2023
cd /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri
mris_place_surface --area-map ../surf/lh.white ../surf/lh.area
#@# pial curv lh Wed Oct 11 01:21:17 UTC 2023
cd /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri
mris_place_surface --curv-map ../surf/lh.pial 2 10 ../surf/lh.curv.pial
#@# pial area lh Wed Oct 11 01:21:20 UTC 2023
cd /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri
mris_place_surface --area-map ../surf/lh.pial ../surf/lh.area.pial
#@# thickness lh Wed Oct 11 01:21:22 UTC 2023
cd /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri
mris_place_surface --thickness ../surf/lh.white ../surf/lh.pial 20 5 ../surf/lh.thickness
#@# area and vertex vol lh Wed Oct 11 01:22:28 UTC 2023
cd /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri
mris_place_surface --thickness ../surf/lh.white ../surf/lh.pial 20 5 ../surf/lh.thickness
#@# white curv rh Wed Oct 11 01:22:32 UTC 2023
cd /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri
mris_place_surface --curv-map ../surf/rh.white 2 10 ../surf/rh.curv
#@# white area rh Wed Oct 11 01:22:36 UTC 2023
cd /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri
mris_place_surface --area-map ../surf/rh.white ../surf/rh.area
#@# pial curv rh Wed Oct 11 01:22:37 UTC 2023
cd /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri
mris_place_surface --curv-map ../surf/rh.pial 2 10 ../surf/rh.curv.pial
#@# pial area rh Wed Oct 11 01:22:41 UTC 2023
cd /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri
mris_place_surface --area-map ../surf/rh.pial ../surf/rh.area.pial
#@# thickness rh Wed Oct 11 01:22:43 UTC 2023
cd /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri
mris_place_surface --thickness ../surf/rh.white ../surf/rh.pial 20 5 ../surf/rh.thickness
#@# area and vertex vol rh Wed Oct 11 01:23:49 UTC 2023
cd /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri
mris_place_surface --thickness ../surf/rh.white ../surf/rh.pial 20 5 ../surf/rh.thickness

#-----------------------------------------
#@# Curvature Stats lh Wed Oct 11 01:23:53 UTC 2023

 mris_curvature_stats -m --writeCurvatureFiles -G -o ../stats/lh.curv.stats -F smoothwm sub-04 lh curv sulc 


#-----------------------------------------
#@# Curvature Stats rh Wed Oct 11 01:23:59 UTC 2023

 mris_curvature_stats -m --writeCurvatureFiles -G -o ../stats/rh.curv.stats -F smoothwm sub-04 rh curv sulc 

#--------------------------------------------
#@# Cortical ribbon mask Wed Oct 11 01:24:04 UTC 2023

 mris_volmask --aseg_name aseg.presurf --label_left_white 2 --label_left_ribbon 3 --label_right_white 41 --label_right_ribbon 42 --save_ribbon sub-04 

#-----------------------------------------
#@# Cortical Parc 2 lh Wed Oct 11 01:42:09 UTC 2023

 mris_ca_label -l ../label/lh.cortex.label -aseg ../mri/aseg.presurf.mgz -seed 1234 sub-04 lh ../surf/lh.sphere.reg /opt/freesurfer/average/lh.CDaparc.atlas.acfb40.noaparc.i12.2016-08-02.gcs ../label/lh.aparc.a2009s.annot 

#-----------------------------------------
#@# Cortical Parc 2 rh Wed Oct 11 01:42:41 UTC 2023

 mris_ca_label -l ../label/rh.cortex.label -aseg ../mri/aseg.presurf.mgz -seed 1234 sub-04 rh ../surf/rh.sphere.reg /opt/freesurfer/average/rh.CDaparc.atlas.acfb40.noaparc.i12.2016-08-02.gcs ../label/rh.aparc.a2009s.annot 

#-----------------------------------------
#@# Cortical Parc 3 lh Wed Oct 11 01:43:15 UTC 2023

 mris_ca_label -l ../label/lh.cortex.label -aseg ../mri/aseg.presurf.mgz -seed 1234 sub-04 lh ../surf/lh.sphere.reg /opt/freesurfer/average/lh.DKTaparc.atlas.acfb40.noaparc.i12.2016-08-02.gcs ../label/lh.aparc.DKTatlas.annot 

#-----------------------------------------
#@# Cortical Parc 3 rh Wed Oct 11 01:43:38 UTC 2023

 mris_ca_label -l ../label/rh.cortex.label -aseg ../mri/aseg.presurf.mgz -seed 1234 sub-04 rh ../surf/rh.sphere.reg /opt/freesurfer/average/rh.DKTaparc.atlas.acfb40.noaparc.i12.2016-08-02.gcs ../label/rh.aparc.DKTatlas.annot 

#-----------------------------------------
#@# Relabel Hypointensities Wed Oct 11 01:44:01 UTC 2023

 mri_relabel_hypointensities aseg.presurf.mgz ../surf aseg.presurf.hypos.mgz 

#-----------------------------------------
#@# APas-to-ASeg Wed Oct 11 01:44:46 UTC 2023

 mri_surf2volseg --o aseg.mgz --i aseg.presurf.hypos.mgz --fix-presurf-with-ribbon /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/mri/ribbon.mgz --threads 4 --lh-cortex-mask /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/label/lh.cortex.label --lh-white /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/surf/lh.white --lh-pial /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/surf/lh.pial --rh-cortex-mask /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/label/rh.cortex.label --rh-white /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/surf/rh.white --rh-pial /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/surf/rh.pial 


 mri_brainvol_stats --subject sub-04 

#-----------------------------------------
#@# AParc-to-ASeg aparc Wed Oct 11 01:45:14 UTC 2023

 mri_surf2volseg --o aparc+aseg.mgz --label-cortex --i aseg.mgz --threads 4 --lh-annot /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/label/lh.aparc.annot 1000 --lh-cortex-mask /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/label/lh.cortex.label --lh-white /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/surf/lh.white --lh-pial /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/surf/lh.pial --rh-annot /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/label/rh.aparc.annot 2000 --rh-cortex-mask /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/label/rh.cortex.label --rh-white /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/surf/rh.white --rh-pial /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/surf/rh.pial 

#-----------------------------------------
#@# AParc-to-ASeg aparc.a2009s Wed Oct 11 01:49:55 UTC 2023

 mri_surf2volseg --o aparc.a2009s+aseg.mgz --label-cortex --i aseg.mgz --threads 4 --lh-annot /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/label/lh.aparc.a2009s.annot 11100 --lh-cortex-mask /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/label/lh.cortex.label --lh-white /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/surf/lh.white --lh-pial /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/surf/lh.pial --rh-annot /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/label/rh.aparc.a2009s.annot 12100 --rh-cortex-mask /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/label/rh.cortex.label --rh-white /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/surf/rh.white --rh-pial /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/surf/rh.pial 

#-----------------------------------------
#@# AParc-to-ASeg aparc.DKTatlas Wed Oct 11 01:54:37 UTC 2023

 mri_surf2volseg --o aparc.DKTatlas+aseg.mgz --label-cortex --i aseg.mgz --threads 4 --lh-annot /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/label/lh.aparc.DKTatlas.annot 1000 --lh-cortex-mask /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/label/lh.cortex.label --lh-white /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/surf/lh.white --lh-pial /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/surf/lh.pial --rh-annot /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/label/rh.aparc.DKTatlas.annot 2000 --rh-cortex-mask /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/label/rh.cortex.label --rh-white /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/surf/rh.white --rh-pial /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/surf/rh.pial 

#-----------------------------------------
#@# WMParc Wed Oct 11 01:59:16 UTC 2023

 mri_surf2volseg --o wmparc.mgz --label-wm --i aparc+aseg.mgz --threads 4 --lh-annot /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/label/lh.aparc.annot 3000 --lh-cortex-mask /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/label/lh.cortex.label --lh-white /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/surf/lh.white --lh-pial /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/surf/lh.pial --rh-annot /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/label/rh.aparc.annot 4000 --rh-cortex-mask /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/label/rh.cortex.label --rh-white /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/surf/rh.white --rh-pial /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/sub-04/surf/rh.pial 


 mri_segstats --seed 1234 --seg mri/wmparc.mgz --sum stats/wmparc.stats --pv mri/norm.mgz --excludeid 0 --brainmask mri/brainmask.mgz --in mri/norm.mgz --in-intensity-name norm --in-intensity-units MR --subject sub-04 --surf-wm-vol --ctab /opt/freesurfer/WMParcStatsLUT.txt --etiv 

#-----------------------------------------
#@# Parcellation Stats lh Wed Oct 11 02:06:36 UTC 2023

 mris_anatomical_stats -th3 -mgz -cortex ../label/lh.cortex.label -f ../stats/lh.aparc.stats -b -a ../label/lh.aparc.annot -c ../label/aparc.annot.ctab sub-04 lh white 


 mris_anatomical_stats -th3 -mgz -cortex ../label/lh.cortex.label -f ../stats/lh.aparc.pial.stats -b -a ../label/lh.aparc.annot -c ../label/aparc.annot.ctab sub-04 lh pial 

#-----------------------------------------
#@# Parcellation Stats rh Wed Oct 11 02:07:53 UTC 2023

 mris_anatomical_stats -th3 -mgz -cortex ../label/rh.cortex.label -f ../stats/rh.aparc.stats -b -a ../label/rh.aparc.annot -c ../label/aparc.annot.ctab sub-04 rh white 


 mris_anatomical_stats -th3 -mgz -cortex ../label/rh.cortex.label -f ../stats/rh.aparc.pial.stats -b -a ../label/rh.aparc.annot -c ../label/aparc.annot.ctab sub-04 rh pial 

#-----------------------------------------
#@# Parcellation Stats 2 lh Wed Oct 11 02:09:10 UTC 2023

 mris_anatomical_stats -th3 -mgz -cortex ../label/lh.cortex.label -f ../stats/lh.aparc.a2009s.stats -b -a ../label/lh.aparc.a2009s.annot -c ../label/aparc.annot.a2009s.ctab sub-04 lh white 

#-----------------------------------------
#@# Parcellation Stats 2 rh Wed Oct 11 02:09:49 UTC 2023

 mris_anatomical_stats -th3 -mgz -cortex ../label/rh.cortex.label -f ../stats/rh.aparc.a2009s.stats -b -a ../label/rh.aparc.a2009s.annot -c ../label/aparc.annot.a2009s.ctab sub-04 rh white 

#-----------------------------------------
#@# Parcellation Stats 3 lh Wed Oct 11 02:10:29 UTC 2023

 mris_anatomical_stats -th3 -mgz -cortex ../label/lh.cortex.label -f ../stats/lh.aparc.DKTatlas.stats -b -a ../label/lh.aparc.DKTatlas.annot -c ../label/aparc.annot.DKTatlas.ctab sub-04 lh white 

#-----------------------------------------
#@# Parcellation Stats 3 rh Wed Oct 11 02:11:07 UTC 2023

 mris_anatomical_stats -th3 -mgz -cortex ../label/rh.cortex.label -f ../stats/rh.aparc.DKTatlas.stats -b -a ../label/rh.aparc.DKTatlas.annot -c ../label/aparc.annot.DKTatlas.ctab sub-04 rh white 

#--------------------------------------------
#@# ASeg Stats Wed Oct 11 02:11:45 UTC 2023

 mri_segstats --seed 1234 --seg mri/aseg.mgz --sum stats/aseg.stats --pv mri/norm.mgz --empty --brainmask mri/brainmask.mgz --brain-vol-from-seg --excludeid 0 --excl-ctxgmwm --supratent --subcortgray --in mri/norm.mgz --in-intensity-name norm --in-intensity-units MR --etiv --surf-wm-vol --surf-ctx-vol --totalgray --euler --ctab /opt/freesurfer/ASegStatsLUT.txt --subject sub-04 

#--------------------------------------------
#@# BA_exvivo Labels lh Wed Oct 11 02:13:27 UTC 2023

 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/lh.BA1_exvivo.label --trgsubject sub-04 --trglabel ./lh.BA1_exvivo.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/lh.BA2_exvivo.label --trgsubject sub-04 --trglabel ./lh.BA2_exvivo.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/lh.BA3a_exvivo.label --trgsubject sub-04 --trglabel ./lh.BA3a_exvivo.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/lh.BA3b_exvivo.label --trgsubject sub-04 --trglabel ./lh.BA3b_exvivo.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/lh.BA4a_exvivo.label --trgsubject sub-04 --trglabel ./lh.BA4a_exvivo.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/lh.BA4p_exvivo.label --trgsubject sub-04 --trglabel ./lh.BA4p_exvivo.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/lh.BA6_exvivo.label --trgsubject sub-04 --trglabel ./lh.BA6_exvivo.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/lh.BA44_exvivo.label --trgsubject sub-04 --trglabel ./lh.BA44_exvivo.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/lh.BA45_exvivo.label --trgsubject sub-04 --trglabel ./lh.BA45_exvivo.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/lh.V1_exvivo.label --trgsubject sub-04 --trglabel ./lh.V1_exvivo.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/lh.V2_exvivo.label --trgsubject sub-04 --trglabel ./lh.V2_exvivo.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/lh.MT_exvivo.label --trgsubject sub-04 --trglabel ./lh.MT_exvivo.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/lh.entorhinal_exvivo.label --trgsubject sub-04 --trglabel ./lh.entorhinal_exvivo.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/lh.perirhinal_exvivo.label --trgsubject sub-04 --trglabel ./lh.perirhinal_exvivo.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/lh.FG1.mpm.vpnl.label --trgsubject sub-04 --trglabel ./lh.FG1.mpm.vpnl.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/lh.FG2.mpm.vpnl.label --trgsubject sub-04 --trglabel ./lh.FG2.mpm.vpnl.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/lh.FG3.mpm.vpnl.label --trgsubject sub-04 --trglabel ./lh.FG3.mpm.vpnl.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/lh.FG4.mpm.vpnl.label --trgsubject sub-04 --trglabel ./lh.FG4.mpm.vpnl.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/lh.hOc1.mpm.vpnl.label --trgsubject sub-04 --trglabel ./lh.hOc1.mpm.vpnl.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/lh.hOc2.mpm.vpnl.label --trgsubject sub-04 --trglabel ./lh.hOc2.mpm.vpnl.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/lh.hOc3v.mpm.vpnl.label --trgsubject sub-04 --trglabel ./lh.hOc3v.mpm.vpnl.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/lh.hOc4v.mpm.vpnl.label --trgsubject sub-04 --trglabel ./lh.hOc4v.mpm.vpnl.label --hemi lh --regmethod surface 


 mris_label2annot --s sub-04 --ctab /opt/freesurfer/average/colortable_vpnl.txt --hemi lh --a mpm.vpnl --maxstatwinner --noverbose --l lh.FG1.mpm.vpnl.label --l lh.FG2.mpm.vpnl.label --l lh.FG3.mpm.vpnl.label --l lh.FG4.mpm.vpnl.label --l lh.hOc1.mpm.vpnl.label --l lh.hOc2.mpm.vpnl.label --l lh.hOc3v.mpm.vpnl.label --l lh.hOc4v.mpm.vpnl.label 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/lh.BA1_exvivo.thresh.label --trgsubject sub-04 --trglabel ./lh.BA1_exvivo.thresh.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/lh.BA2_exvivo.thresh.label --trgsubject sub-04 --trglabel ./lh.BA2_exvivo.thresh.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/lh.BA3a_exvivo.thresh.label --trgsubject sub-04 --trglabel ./lh.BA3a_exvivo.thresh.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/lh.BA3b_exvivo.thresh.label --trgsubject sub-04 --trglabel ./lh.BA3b_exvivo.thresh.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/lh.BA4a_exvivo.thresh.label --trgsubject sub-04 --trglabel ./lh.BA4a_exvivo.thresh.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/lh.BA4p_exvivo.thresh.label --trgsubject sub-04 --trglabel ./lh.BA4p_exvivo.thresh.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/lh.BA6_exvivo.thresh.label --trgsubject sub-04 --trglabel ./lh.BA6_exvivo.thresh.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/lh.BA44_exvivo.thresh.label --trgsubject sub-04 --trglabel ./lh.BA44_exvivo.thresh.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/lh.BA45_exvivo.thresh.label --trgsubject sub-04 --trglabel ./lh.BA45_exvivo.thresh.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/lh.V1_exvivo.thresh.label --trgsubject sub-04 --trglabel ./lh.V1_exvivo.thresh.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/lh.V2_exvivo.thresh.label --trgsubject sub-04 --trglabel ./lh.V2_exvivo.thresh.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/lh.MT_exvivo.thresh.label --trgsubject sub-04 --trglabel ./lh.MT_exvivo.thresh.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/lh.entorhinal_exvivo.thresh.label --trgsubject sub-04 --trglabel ./lh.entorhinal_exvivo.thresh.label --hemi lh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/lh.perirhinal_exvivo.thresh.label --trgsubject sub-04 --trglabel ./lh.perirhinal_exvivo.thresh.label --hemi lh --regmethod surface 


 mris_label2annot --s sub-04 --hemi lh --ctab /opt/freesurfer/average/colortable_BA.txt --l lh.BA1_exvivo.label --l lh.BA2_exvivo.label --l lh.BA3a_exvivo.label --l lh.BA3b_exvivo.label --l lh.BA4a_exvivo.label --l lh.BA4p_exvivo.label --l lh.BA6_exvivo.label --l lh.BA44_exvivo.label --l lh.BA45_exvivo.label --l lh.V1_exvivo.label --l lh.V2_exvivo.label --l lh.MT_exvivo.label --l lh.perirhinal_exvivo.label --l lh.entorhinal_exvivo.label --a BA_exvivo --maxstatwinner --noverbose 


 mris_label2annot --s sub-04 --hemi lh --ctab /opt/freesurfer/average/colortable_BA.txt --l lh.BA1_exvivo.thresh.label --l lh.BA2_exvivo.thresh.label --l lh.BA3a_exvivo.thresh.label --l lh.BA3b_exvivo.thresh.label --l lh.BA4a_exvivo.thresh.label --l lh.BA4p_exvivo.thresh.label --l lh.BA6_exvivo.thresh.label --l lh.BA44_exvivo.thresh.label --l lh.BA45_exvivo.thresh.label --l lh.V1_exvivo.thresh.label --l lh.V2_exvivo.thresh.label --l lh.MT_exvivo.thresh.label --l lh.perirhinal_exvivo.thresh.label --l lh.entorhinal_exvivo.thresh.label --a BA_exvivo.thresh --maxstatwinner --noverbose 


 mris_anatomical_stats -th3 -mgz -f ../stats/lh.BA_exvivo.stats -b -a ./lh.BA_exvivo.annot -c ./BA_exvivo.ctab sub-04 lh white 


 mris_anatomical_stats -th3 -mgz -f ../stats/lh.BA_exvivo.thresh.stats -b -a ./lh.BA_exvivo.thresh.annot -c ./BA_exvivo.thresh.ctab sub-04 lh white 

#--------------------------------------------
#@# BA_exvivo Labels rh Wed Oct 11 02:19:38 UTC 2023

 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/rh.BA1_exvivo.label --trgsubject sub-04 --trglabel ./rh.BA1_exvivo.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/rh.BA2_exvivo.label --trgsubject sub-04 --trglabel ./rh.BA2_exvivo.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/rh.BA3a_exvivo.label --trgsubject sub-04 --trglabel ./rh.BA3a_exvivo.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/rh.BA3b_exvivo.label --trgsubject sub-04 --trglabel ./rh.BA3b_exvivo.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/rh.BA4a_exvivo.label --trgsubject sub-04 --trglabel ./rh.BA4a_exvivo.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/rh.BA4p_exvivo.label --trgsubject sub-04 --trglabel ./rh.BA4p_exvivo.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/rh.BA6_exvivo.label --trgsubject sub-04 --trglabel ./rh.BA6_exvivo.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/rh.BA44_exvivo.label --trgsubject sub-04 --trglabel ./rh.BA44_exvivo.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/rh.BA45_exvivo.label --trgsubject sub-04 --trglabel ./rh.BA45_exvivo.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/rh.V1_exvivo.label --trgsubject sub-04 --trglabel ./rh.V1_exvivo.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/rh.V2_exvivo.label --trgsubject sub-04 --trglabel ./rh.V2_exvivo.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/rh.MT_exvivo.label --trgsubject sub-04 --trglabel ./rh.MT_exvivo.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/rh.entorhinal_exvivo.label --trgsubject sub-04 --trglabel ./rh.entorhinal_exvivo.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/rh.perirhinal_exvivo.label --trgsubject sub-04 --trglabel ./rh.perirhinal_exvivo.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/rh.FG1.mpm.vpnl.label --trgsubject sub-04 --trglabel ./rh.FG1.mpm.vpnl.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/rh.FG2.mpm.vpnl.label --trgsubject sub-04 --trglabel ./rh.FG2.mpm.vpnl.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/rh.FG3.mpm.vpnl.label --trgsubject sub-04 --trglabel ./rh.FG3.mpm.vpnl.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/rh.FG4.mpm.vpnl.label --trgsubject sub-04 --trglabel ./rh.FG4.mpm.vpnl.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/rh.hOc1.mpm.vpnl.label --trgsubject sub-04 --trglabel ./rh.hOc1.mpm.vpnl.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/rh.hOc2.mpm.vpnl.label --trgsubject sub-04 --trglabel ./rh.hOc2.mpm.vpnl.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/rh.hOc3v.mpm.vpnl.label --trgsubject sub-04 --trglabel ./rh.hOc3v.mpm.vpnl.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/rh.hOc4v.mpm.vpnl.label --trgsubject sub-04 --trglabel ./rh.hOc4v.mpm.vpnl.label --hemi rh --regmethod surface 


 mris_label2annot --s sub-04 --ctab /opt/freesurfer/average/colortable_vpnl.txt --hemi rh --a mpm.vpnl --maxstatwinner --noverbose --l rh.FG1.mpm.vpnl.label --l rh.FG2.mpm.vpnl.label --l rh.FG3.mpm.vpnl.label --l rh.FG4.mpm.vpnl.label --l rh.hOc1.mpm.vpnl.label --l rh.hOc2.mpm.vpnl.label --l rh.hOc3v.mpm.vpnl.label --l rh.hOc4v.mpm.vpnl.label 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/rh.BA1_exvivo.thresh.label --trgsubject sub-04 --trglabel ./rh.BA1_exvivo.thresh.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/rh.BA2_exvivo.thresh.label --trgsubject sub-04 --trglabel ./rh.BA2_exvivo.thresh.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/rh.BA3a_exvivo.thresh.label --trgsubject sub-04 --trglabel ./rh.BA3a_exvivo.thresh.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/rh.BA3b_exvivo.thresh.label --trgsubject sub-04 --trglabel ./rh.BA3b_exvivo.thresh.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/rh.BA4a_exvivo.thresh.label --trgsubject sub-04 --trglabel ./rh.BA4a_exvivo.thresh.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/rh.BA4p_exvivo.thresh.label --trgsubject sub-04 --trglabel ./rh.BA4p_exvivo.thresh.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/rh.BA6_exvivo.thresh.label --trgsubject sub-04 --trglabel ./rh.BA6_exvivo.thresh.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/rh.BA44_exvivo.thresh.label --trgsubject sub-04 --trglabel ./rh.BA44_exvivo.thresh.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/rh.BA45_exvivo.thresh.label --trgsubject sub-04 --trglabel ./rh.BA45_exvivo.thresh.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/rh.V1_exvivo.thresh.label --trgsubject sub-04 --trglabel ./rh.V1_exvivo.thresh.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/rh.V2_exvivo.thresh.label --trgsubject sub-04 --trglabel ./rh.V2_exvivo.thresh.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/rh.MT_exvivo.thresh.label --trgsubject sub-04 --trglabel ./rh.MT_exvivo.thresh.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/rh.entorhinal_exvivo.thresh.label --trgsubject sub-04 --trglabel ./rh.entorhinal_exvivo.thresh.label --hemi rh --regmethod surface 


 mri_label2label --srcsubject fsaverage --srclabel /localscratch/bpinsard.41493768.0/freesurfer_template_autoreconall_sub04.job/fsaverage/label/rh.perirhinal_exvivo.thresh.label --trgsubject sub-04 --trglabel ./rh.perirhinal_exvivo.thresh.label --hemi rh --regmethod surface 


 mris_label2annot --s sub-04 --hemi rh --ctab /opt/freesurfer/average/colortable_BA.txt --l rh.BA1_exvivo.label --l rh.BA2_exvivo.label --l rh.BA3a_exvivo.label --l rh.BA3b_exvivo.label --l rh.BA4a_exvivo.label --l rh.BA4p_exvivo.label --l rh.BA6_exvivo.label --l rh.BA44_exvivo.label --l rh.BA45_exvivo.label --l rh.V1_exvivo.label --l rh.V2_exvivo.label --l rh.MT_exvivo.label --l rh.perirhinal_exvivo.label --l rh.entorhinal_exvivo.label --a BA_exvivo --maxstatwinner --noverbose 


 mris_label2annot --s sub-04 --hemi rh --ctab /opt/freesurfer/average/colortable_BA.txt --l rh.BA1_exvivo.thresh.label --l rh.BA2_exvivo.thresh.label --l rh.BA3a_exvivo.thresh.label --l rh.BA3b_exvivo.thresh.label --l rh.BA4a_exvivo.thresh.label --l rh.BA4p_exvivo.thresh.label --l rh.BA6_exvivo.thresh.label --l rh.BA44_exvivo.thresh.label --l rh.BA45_exvivo.thresh.label --l rh.V1_exvivo.thresh.label --l rh.V2_exvivo.thresh.label --l rh.MT_exvivo.thresh.label --l rh.perirhinal_exvivo.thresh.label --l rh.entorhinal_exvivo.thresh.label --a BA_exvivo.thresh --maxstatwinner --noverbose 


 mris_anatomical_stats -th3 -mgz -f ../stats/rh.BA_exvivo.stats -b -a ./rh.BA_exvivo.annot -c ./BA_exvivo.ctab sub-04 rh white 


 mris_anatomical_stats -th3 -mgz -f ../stats/rh.BA_exvivo.thresh.stats -b -a ./rh.BA_exvivo.thresh.annot -c ./BA_exvivo.thresh.ctab sub-04 rh white 

