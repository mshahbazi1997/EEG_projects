function spm_extractor(runIdx)

num=num2str(runIdx);
mkdir(['C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\spmDir' num]);

subjects = 001;
spmDir = (['C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\spmDir' num]);
timingDir = 'C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\dataset\all_runs_events.tsv';
matPrefix = 'testMulti';
dataDir = 'C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\dataset';

funcs = {'run-01_bold.nii', 'run-02_bold.nii', 'run-03_bold.nii'...
    ,'run-04_bold.nii','run-05_bold.nii','run-06_bold.nii','run-07_bold.nii'};

subject = subjects;
T = tdfread(timingDir );


jobs{1}.stats{1}.fmri_spec.dir = cellstr(spmDir);
jobs{1}.stats{1}.fmri_spec.timing.units = 'secs';
jobs{1}.stats{1}.fmri_spec.timing.RT = 2;
jobs{1}.stats{1}.fmri_spec.timing.fmri_t = 16;
jobs{1}.stats{1}.fmri_spec.timing.fmri_t0 = 8;


A=cellstr(T.trial_type);
nameList = unique(A);
names = nameList';
onsets = cell(1, size(nameList,1));
durations = cell(1, size(nameList,1));
sizeOnsets = size(T.onset, 1);

for nameIdx = 1:size(nameList,1)
    for idx = 1:sizeOnsets
        if( isequal(T.trial_type(idx,1), nameList{nameIdx}(1)) && T.run(idx) == runIdx)
            onsets{nameIdx} = double([onsets{nameIdx} T.onset(idx)]);
            durations{nameIdx} = double([durations{nameIdx} T.duration(idx)]);
        end
    end
end
save ([matPrefix '_' num2str(subject) '_' num2str(runIdx)], 'names', 'onsets', 'durations')

%Grab frames for each run using spm_select, and fill in session
%information within jobs structure
files = spm_select('ExtFPList', dataDir, ['^' funcs{runIdx}], 4:153);

jobs{1}.stats{1}.fmri_spec.sess.scans = cellstr(files);
jobs{1}.stats{1}.fmri_spec.sess.cond = struct('name',names, 'onset', onsets, 'duration',durations);
%     jobs{1}.stats{1}.fmri_spec.sess(runIdx).multi = cellstr([spmDir '\' matPrefix '_' num2str(subject) '_' num2str(runIdx) '.mat']);
jobs{1}.stats{1}.fmri_spec.sess.multi ={''};
jobs{1}.stats{1}.fmri_spec.sess.regress = {''};
jobs{1}.stats{1}.fmri_spec.sess.multi_reg = {''};
jobs{1}.stats{1}.fmri_spec.sess.hpf = 128;

jobs{1}.stats{1}.fmri_spec.fact = {''};
jobs{1}.stats{1}.fmri_spec.bases.hrf = {''};
jobs{1}.stats{1}.fmri_spec.volt = 1;
jobs{1}.stats{1}.fmri_spec.global = 'None';
jobs{1}.stats{1}.fmri_spec.mask = {''};
jobs{1}.stats{1}.fmri_spec.cvi = 'AR(1)';
    
%Navigate to output directory, specify and estimate GLM
cd(spmDir);
spm_jobman('run', jobs)

cd('C:\Users\mahdi\Desktop\HW4_NEURO')


end
