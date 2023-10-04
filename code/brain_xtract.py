import argparse, pathlib
from nipype.pipeline import engine as pe
from niworkflows.anat.ants import init_brain_extraction_wf
from niworkflows.interfaces.freesurfer import FSInjectBrainExtracted


def main(image_path, fs_subjects_dir, fs_subject_id):
    brain_xtract_wf =  init_brain_extraction_wf()
    brain_xtract_wf.base_dir = 'workdir'
    brain_xtract_wf.inputs.inputnode.in_files = [image_path]
    n_inject_fs_brainmask = pe.Node(FSInjectBrainExtracted(), name='inject_fs_brainmask')
    def _pop(inlist):
        if isinstance(inlist, (list, tuple)):
            return inlist[0]
        return inlist
    brain_xtract_wf.connect([
        (brain_xtract_wf.get_node('outputnode'), n_inject_fs_brainmask, [(('out_file', _pop), 'in_brain')]),
    ])


    
    brain_xtract_wf.inputs.inject_fs_brainmask.subjects_dir = fs_subjects_dir
    brain_xtract_wf.inputs.inject_fs_brainmask.subject_id = fs_subject_id

    brain_xtract_wf.run()

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        formatter_class=argparse.RawTextHelpFormatter,
        description="run smriprep brain extraction",
    )
    parser.add_argument(
        "fs_subjects_dir", type=pathlib.Path, help="Path of freesurfer SUBJECTS_DIR"
    )
    parser.add_argument(
        "fs_subject_id", help="id of freesurfer subject"
    )
    parser.add_argument(
        "image_path", type=pathlib.Path, help="Nifti image to skullstrip"
    )
    args = parser.parse_args()

    main(args.image_path.resolve(), args.fs_subjects_dir.resolve(), args.fs_subject_id)



