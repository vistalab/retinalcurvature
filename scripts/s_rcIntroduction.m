%% Interacting with the Chichilnisky data
%
% Retinal curvature introduction script

%%  Open up channel to scitran at stanford labs

st = scitran('stanfordlabs');

%% The Chichilnisky project is in the wandell group
project = st.lookup('wandell/Chichilnisky');

%% See the sessions, or subjects ...
sessions = project.sessions();
subjects = project.subjects();

thisSession = sessions{6};  % Has 005 Rabbit

whichSubject = stSelect(subjects,'label','005 Rabbit');

%% The acquisitions contain the files
acquisitions = thisSession.acquisitions();

%% Finding an acquisition
thisAcquisition = stSelect(acquisitions,'label','AXIAL T2');
thisAcquisition{1}.files
thisFile = stSelect(thisAcquisition{1}.files,'name','Ax_T2_FSE_(thin)_NEX_1_0.02x0.003_3.nii.gz');

%% Download the file

fName = st.fileDownload(thisFile{1});
niftiRead(fName) %Read nifti file
niftiView(fName) %View nifti file

%% Example of documentation
doc('scitran.fileDownload');  %Look at documentation for fileDownload

%%