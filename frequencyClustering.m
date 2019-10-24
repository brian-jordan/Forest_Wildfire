%% Frequency clustering algorithm
% Requires CSV files containing matrices corresponding to fire and non-fire
% audio file frequency spectrums
%
% Rows will indicate different frequency level, columns will indicate
% normalized magnitudes at the specific frequency for audio clips

% Get fire frequency data
csvFireFile = 'fire_magnitudes.csv';

fireFrequencies = csvread(csvFireFile);

frequencies = fireFrequencies(:,1);
magnitudes = fireFrequencies(:,2 : end);

fireMagnitudeAverages = [];
[rows,cols] = size(magnitudes);

for iter = 1 : rows
    fireMagnitudeAverages = [fireMagnitudeAverages; mean(magnitudes(iter, :))];
end
    