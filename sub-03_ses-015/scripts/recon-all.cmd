

#---------------------------------
# New invocation of recon-all Wed Oct 11 00:44:05 UTC 2023 

 mri_convert /localscratch/bpinsard.41498734.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub03_ses015.job/sourcedata/cneuromod.anat.gradcorrect/sub-03/ses-015/anat/sub-03_ses-015_T1w.nii.gz /localscratch/bpinsard.41498734.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub03_ses015.job/sub-03_ses-015/mri/orig/001.mgz 

#--------------------------------------------
#@# MotionCor Wed Oct 11 00:44:13 UTC 2023

 cp /localscratch/bpinsard.41498734.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub03_ses015.job/sub-03_ses-015/mri/orig/001.mgz /localscratch/bpinsard.41498734.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub03_ses015.job/sub-03_ses-015/mri/rawavg.mgz 


 mri_info /localscratch/bpinsard.41498734.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub03_ses015.job/sub-03_ses-015/mri/rawavg.mgz 


 mri_convert /localscratch/bpinsard.41498734.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub03_ses015.job/sub-03_ses-015/mri/rawavg.mgz /localscratch/bpinsard.41498734.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub03_ses015.job/sub-03_ses-015/mri/orig.mgz --conform_min 


 mri_add_xform_to_header -c /localscratch/bpinsard.41498734.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub03_ses015.job/sub-03_ses-015/mri/transforms/talairach.xfm /localscratch/bpinsard.41498734.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub03_ses015.job/sub-03_ses-015/mri/orig.mgz /localscratch/bpinsard.41498734.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub03_ses015.job/sub-03_ses-015/mri/orig.mgz 


 mri_info /localscratch/bpinsard.41498734.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub03_ses015.job/sub-03_ses-015/mri/orig.mgz 

#--------------------------------------------
#@# Talairach Wed Oct 11 00:44:32 UTC 2023

 mri_nu_correct.mni --no-rescale --i orig.mgz --o orig_nu.mgz --ants-n4 --n 1 --proto-iters 1000 --distance 50 


 talairach_avi --i orig_nu.mgz --xfm transforms/talairach.auto.xfm --atlas 3T18yoSchwartzReactN32_as_orig 

talairach_avi log file is transforms/talairach_avi.log...

 cp transforms/talairach.auto.xfm transforms/talairach.xfm 

lta_convert --src orig.mgz --trg /opt/freesurfer/average/mni305.cor.mgz --inxfm transforms/talairach.xfm --outlta transforms/talairach.xfm.lta --subject fsaverage --ltavox2vox
#--------------------------------------------
#@# Talairach Failure Detection Wed Oct 11 00:54:16 UTC 2023

 talairach_afd -T 0.005 -xfm transforms/talairach.xfm 


 awk -f /opt/freesurfer/bin/extract_talairach_avi_QA.awk /localscratch/bpinsard.41498734.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub03_ses015.job/sub-03_ses-015/mri/transforms/talairach_avi.log 


 tal_QC_AZS /localscratch/bpinsard.41498734.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub03_ses015.job/sub-03_ses-015/mri/transforms/talairach_avi.log 

#--------------------------------------------
#@# Nu Intensity Correction Wed Oct 11 00:54:16 UTC 2023

 mri_nu_correct.mni --i orig.mgz --o nu.mgz --uchar transforms/talairach.xfm --cm --proto-iters 1000 --distance 50 --n 1 --ants-n4 


 mri_add_xform_to_header -c /localscratch/bpinsard.41498734.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub03_ses015.job/sub-03_ses-015/mri/transforms/talairach.xfm nu.mgz nu.mgz 

#--------------------------------------------
#@# Intensity Normalization Wed Oct 11 01:04:03 UTC 2023

 mri_normalize -g 1 -seed 1234 -mprage -noconform nu.mgz T1.mgz 

#--------------------------------------------
#@# Skull Stripping Wed Oct 11 01:10:20 UTC 2023

 mri_em_register -skull nu.mgz /opt/freesurfer/average/RB_all_withskull_2020_01_02.gca transforms/talairach_with_skull.lta 


 mri_watershed -T1 -brain_atlas /opt/freesurfer/average/RB_all_withskull_2020_01_02.gca transforms/talairach_with_skull.lta T1.mgz brainmask.auto.mgz 


 cp brainmask.auto.mgz brainmask.mgz 



#---------------------------------
# New invocation of recon-all Wed Oct 11 01:45:04 UTC 2023 
#-------------------------------------
#@# EM Registration Wed Oct 11 01:45:05 UTC 2023

 mri_em_register -uns 3 -mask brainmask.mgz nu.mgz /opt/freesurfer/average/RB_all_2020-01-02.gca transforms/talairach.lta 

#--------------------------------------
#@# CA Normalize Wed Oct 11 01:49:49 UTC 2023

 mri_ca_normalize -c ctrl_pts.mgz -mask brainmask.mgz nu.mgz /opt/freesurfer/average/RB_all_2020-01-02.gca transforms/talairach.lta norm.mgz 

#--------------------------------------
#@# CA Reg Wed Oct 11 01:53:10 UTC 2023

 mri_ca_register -nobigventricles -T transforms/talairach.lta -align-after -mask brainmask.mgz norm.mgz /opt/freesurfer/average/RB_all_2020-01-02.gca transforms/talairach.m3z 

#--------------------------------------
#@# SubCort Seg Wed Oct 11 03:18:10 UTC 2023

 mri_ca_label -relabel_unlikely 9 .3 -prior 0.5 -align norm.mgz transforms/talairach.m3z /opt/freesurfer/average/RB_all_2020-01-02.gca aseg.auto_noCCseg.mgz 

#--------------------------------------
#@# CC Seg Wed Oct 11 05:01:46 UTC 2023

 mri_cc -aseg aseg.auto_noCCseg.mgz -o aseg.auto.mgz -lta /localscratch/bpinsard.41498734.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub03_ses015.job/sub-03_ses-015/mri/transforms/cc_up.lta sub-03_ses-015 

#--------------------------------------
#@# Merge ASeg Wed Oct 11 05:03:22 UTC 2023

 cp aseg.auto.mgz aseg.presurf.mgz 

#--------------------------------------------
#@# Intensity Normalization2 Wed Oct 11 05:03:22 UTC 2023

 mri_normalize -seed 1234 -mprage -aseg aseg.presurf.mgz -mask brainmask.mgz norm.mgz brain.mgz 

#--------------------------------------------
#@# Mask BFS Wed Oct 11 05:10:49 UTC 2023

 mri_mask -T 5 brain.mgz brainmask.mgz brain.finalsurfs.mgz 

#--------------------------------------------
#@# WM Segmentation Wed Oct 11 05:10:51 UTC 2023

 AntsDenoiseImageFs -i brain.mgz -o antsdn.brain.mgz 


 mri_segment -wsizemm 13 -mprage antsdn.brain.mgz wm.seg.mgz 


 mri_edit_wm_with_aseg -keep-in wm.seg.mgz brain.mgz aseg.presurf.mgz wm.asegedit.mgz 


 mri_pretess wm.asegedit.mgz wm norm.mgz wm.mgz 

#--------------------------------------------
#@# Fill Wed Oct 11 05:18:35 UTC 2023

 mri_fill -a ../scripts/ponscc.cut.log -xform transforms/talairach.lta -segmentation aseg.presurf.mgz -ctab /opt/freesurfer/SubCorticalMassLUT.txt wm.mgz filled.mgz 

 cp filled.mgz filled.auto.mgz
#--------------------------------------------
#@# Tessellate lh Wed Oct 11 05:21:26 UTC 2023

 mri_pretess ../mri/filled.mgz 255 ../mri/norm.mgz ../mri/filled-pretess255.mgz 


 mri_tessellate ../mri/filled-pretess255.mgz 255 ../surf/lh.orig.nofix 


 rm -f ../mri/filled-pretess255.mgz 


 mris_extract_main_component ../surf/lh.orig.nofix ../surf/lh.orig.nofix 

#--------------------------------------------
#@# Tessellate rh Wed Oct 11 05:21:34 UTC 2023

 mri_pretess ../mri/filled.mgz 127 ../mri/norm.mgz ../mri/filled-pretess127.mgz 


 mri_tessellate ../mri/filled-pretess127.mgz 127 ../surf/rh.orig.nofix 


 rm -f ../mri/filled-pretess127.mgz 


 mris_extract_main_component ../surf/rh.orig.nofix ../surf/rh.orig.nofix 

#--------------------------------------------
#@# Smooth1 lh Wed Oct 11 05:21:42 UTC 2023

 mris_smooth -nw -seed 1234 ../surf/lh.orig.nofix ../surf/lh.smoothwm.nofix 

#--------------------------------------------
#@# Smooth1 rh Wed Oct 11 05:21:48 UTC 2023

 mris_smooth -nw -seed 1234 ../surf/rh.orig.nofix ../surf/rh.smoothwm.nofix 

#--------------------------------------------
#@# Inflation1 lh Wed Oct 11 05:21:55 UTC 2023

 mris_inflate -no-save-sulc ../surf/lh.smoothwm.nofix ../surf/lh.inflated.nofix 

#--------------------------------------------
#@# Inflation1 rh Wed Oct 11 05:22:26 UTC 2023

 mris_inflate -no-save-sulc ../surf/rh.smoothwm.nofix ../surf/rh.inflated.nofix 

#--------------------------------------------
#@# QSphere lh Wed Oct 11 05:22:57 UTC 2023

 mris_sphere -q -p 6 -a 128 -seed 1234 ../surf/lh.inflated.nofix ../surf/lh.qsphere.nofix 

#--------------------------------------------
#@# QSphere rh Wed Oct 11 05:25:31 UTC 2023

 mris_sphere -q -p 6 -a 128 -seed 1234 ../surf/rh.inflated.nofix ../surf/rh.qsphere.nofix 

#@# Fix Topology lh Wed Oct 11 05:28:15 UTC 2023

 mris_fix_topology -mgz -sphere qsphere.nofix -inflated inflated.nofix -orig orig.nofix -out orig.premesh -ga -seed 1234 sub-03_ses-015 lh 

#@# Fix Topology rh Wed Oct 11 05:31:38 UTC 2023

 mris_fix_topology -mgz -sphere qsphere.nofix -inflated inflated.nofix -orig orig.nofix -out orig.premesh -ga -seed 1234 sub-03_ses-015 rh 


 mris_euler_number ../surf/lh.orig.premesh 


 mris_euler_number ../surf/rh.orig.premesh 


 mris_remesh --remesh --iters 3 --input /localscratch/bpinsard.41498734.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub03_ses015.job/sub-03_ses-015/surf/lh.orig.premesh --output /localscratch/bpinsard.41498734.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub03_ses015.job/sub-03_ses-015/surf/lh.orig 


 mris_remesh --remesh --iters 3 --input /localscratch/bpinsard.41498734.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub03_ses015.job/sub-03_ses-015/surf/rh.orig.premesh --output /localscratch/bpinsard.41498734.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub03_ses015.job/sub-03_ses-015/surf/rh.orig 


 mris_remove_intersection ../surf/lh.orig ../surf/lh.orig 


 rm -f ../surf/lh.inflated 


 mris_remove_intersection ../surf/rh.orig ../surf/rh.orig 


 rm -f ../surf/rh.inflated 

#--------------------------------------------
#@# AutoDetGWStats lh Wed Oct 11 05:38:07 UTC 2023
cd /localscratch/bpinsard.41498734.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub03_ses015.job/sub-03_ses-015/mri
mris_autodet_gwstats --o ../surf/autodet.gw.stats.lh.dat --i brain.finalsurfs.mgz --wm wm.mgz --surf ../surf/lh.orig.premesh
#--------------------------------------------
#@# AutoDetGWStats rh Wed Oct 11 05:38:17 UTC 2023
cd /localscratch/bpinsard.41498734.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub03_ses015.job/sub-03_ses-015/mri
mris_autodet_gwstats --o ../surf/autodet.gw.stats.rh.dat --i brain.finalsurfs.mgz --wm wm.mgz --surf ../surf/rh.orig.premesh
#--------------------------------------------
#@# WhitePreAparc lh Wed Oct 11 05:38:26 UTC 2023
cd /localscratch/bpinsard.41498734.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub03_ses015.job/sub-03_ses-015/mri
mris_place_surface --adgws-in ../surf/autodet.gw.stats.lh.dat --wm wm.mgz --threads 4 --invol brain.finalsurfs.mgz --lh --i ../surf/lh.orig --o ../surf/lh.white.preaparc --white --seg aseg.presurf.mgz --nsmooth 5
#--------------------------------------------
#@# WhitePreAparc rh Wed Oct 11 05:43:40 UTC 2023
cd /localscratch/bpinsard.41498734.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub03_ses015.job/sub-03_ses-015/mri
mris_place_surface --adgws-in ../surf/autodet.gw.stats.rh.dat --wm wm.mgz --threads 4 --invol brain.finalsurfs.mgz --rh --i ../surf/rh.orig --o ../surf/rh.white.preaparc --white --seg aseg.presurf.mgz --nsmooth 5
#--------------------------------------------
#@# CortexLabel lh Wed Oct 11 05:49:03 UTC 2023
cd /localscratch/bpinsard.41498734.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub03_ses015.job/sub-03_ses-015/mri
mri_label2label --label-cortex ../surf/lh.white.preaparc aseg.presurf.mgz 0 ../label/lh.cortex.label
#--------------------------------------------
#@# CortexLabel+HipAmyg lh Wed Oct 11 05:49:38 UTC 2023
cd /localscratch/bpinsard.41498734.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub03_ses015.job/sub-03_ses-015/mri
mri_label2label --label-cortex ../surf/lh.white.preaparc aseg.presurf.mgz 1 ../label/lh.cortex+hipamyg.label
#--------------------------------------------
#@# CortexLabel rh Wed Oct 11 05:50:13 UTC 2023
cd /localscratch/bpinsard.41498734.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub03_ses015.job/sub-03_ses-015/mri
mri_label2label --label-cortex ../surf/rh.white.preaparc aseg.presurf.mgz 0 ../label/rh.cortex.label
#--------------------------------------------
#@# CortexLabel+HipAmyg rh Wed Oct 11 05:50:55 UTC 2023
cd /localscratch/bpinsard.41498734.0/freesurfer_crosssectional_autorecon1smriprep_skullstripautorecon2autorecon3_sub03_ses015.job/sub-03_ses-015/mri
mri_label2label --label-cortex ../surf/rh.white.preaparc aseg.presurf.mgz 1 ../label/rh.cortex+hipamyg.label
#--------------------------------------------
#@# Smooth2 lh Wed Oct 11 05:51:35 UTC 2023

 mris_smooth -n 3 -nw -seed 1234 ../surf/lh.white.preaparc ../surf/lh.smoothwm 

#--------------------------------------------
#@# Smooth2 rh Wed Oct 11 05:51:42 UTC 2023

 mris_smooth -n 3 -nw -seed 1234 ../surf/rh.white.preaparc ../surf/rh.smoothwm 

#--------------------------------------------
#@# Inflation2 lh Wed Oct 11 05:51:49 UTC 2023

 mris_inflate ../surf/lh.smoothwm ../surf/lh.inflated 

#--------------------------------------------
#@# Inflation2 rh Wed Oct 11 05:52:23 UTC 2023

 mris_inflate ../surf/rh.smoothwm ../surf/rh.inflated 

#--------------------------------------------
#@# Curv .H and .K lh Wed Oct 11 05:52:59 UTC 2023

 mris_curvature -w -seed 1234 lh.white.preaparc 


 mris_curvature -seed 1234 -thresh .999 -n -a 5 -w -distances 10 10 lh.inflated 

#--------------------------------------------
#@# Curv .H and .K rh Wed Oct 11 05:54:53 UTC 2023

 mris_curvature -w -seed 1234 rh.white.preaparc 


 mris_curvature -seed 1234 -thresh .999 -n -a 5 -w -distances 10 10 rh.inflated 

