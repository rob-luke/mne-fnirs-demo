% addpath(genpath('nirs-toolbox'))

raw = nirs.io.loadNIRx('C:\\Users\\mq20180437\\mne_data\\MNE-testing-data\\NIRx\\nirx_15_2_recording', false);
raw.probe.link([1, 33], :) 
%     source    detector    type
%     ______    ________    ____
% 
%       1          1        760 
%       1          1        850 
data = raw.data(:, [1, 33]);
figure; plot(data)
save('raw_test.mat', 'data')


pipeline = nirs.modules.OpticalDensity();
OD_data = pipeline.run(raw);
OD_data.probe.link([1, 33], :) 
%     source    detector    type
%     ______    ________    ____
% 
%       1          1        760 
%       1          1        850  
data = OD_data.data(:, [1, 33]);
save('od_test.mat', 'data')


pipeline = nirs.modules.BeerLambertLaw();
BL_data = pipeline.run(OD_data);
BL_data.probe.link([1, 2, 3, 4], :) 
%     source    detector    type 
%     ______    ________    _____
% 
%       1           1       'hbo'
%       1           1       'hbr'
%       1          10       'hbo'
%       1          10       'hbr'   
data = BL_data.data(:, [1, 2, 3, 4]);
save('bl_test.mat', 'data')
