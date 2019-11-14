%% Frequency clustering algorithm
% Requires CSV files containing matrices corresponding to fire and non-fire
% audio file frequency spectrums
%
% Rows will indicate different frequency level, columns will indicate
% normalized magnitudes at the specific frequency for audio clips

function output = frequencyClustering()
% Get fire frequency data
csvFireFile = 'fire_magnitudes.csv';
csvFireTrainedFile = 'fire_trained.csv';

fireFrequencies = csvread(csvFireFile);

frequencies = fireFrequencies(:,1);
magnitudes = fireFrequencies(:,2 : end);

fireMagnitudeAverages = [];
[rows,cols] = size(magnitudes);

for iter = 1 : rows
    fireMagnitudeAverages = [fireMagnitudeAverages; mean(magnitudes(iter, :))];
end

fireResultMatrix = [frequencies, fireMagnitudeAverages];

csvwrite(csvFireTrainedFile, fireResultMatrix);

% Get ambient frequency data
csvAmbientFile = 'ambient_magnitudes.csv';
csvAmbientTrainedFile = 'ambient_trained.csv';

fireFrequencies = csvread(csvAmbientFile);

frequencies = fireFrequencies(:,1);
magnitudes = fireFrequencies(:,2 : end);

ambientMagnitudeAverages = [];
[rows,cols] = size(magnitudes);

for iter = 1 : rows
    ambientMagnitudeAverages = [ambientMagnitudeAverages; mean(magnitudes(iter, :))];
end

ambientResultMatrix = [frequencies, ambientMagnitudeAverages];

csvwrite(csvAmbientTrainedFile, ambientResultMatrix);
output = 1;
end
    