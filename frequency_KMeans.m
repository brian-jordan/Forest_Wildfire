%% Frequency KNN
function output = frequency_KNN()
%% Read CSV Files
% Get fire frequency data
csvFireTrained = 'fire_trained.csv';
csvAmbientTrained = 'ambient_trained.csv';

fireTrained = csvread(csvFireTrained);
ambientTrained = csvread(csvAmbientTrained);

trainedFireAverages = fireTrained(:,2);
trainedAmbientAverages = ambientTrained(:,2);

csvFireData = 'fire_magnitudes.csv';
fireData = csvread(csvFireData);

fireMagnitudes = fireData(:, 2 : end);

csvAmbientData = 'ambient_magnitudes.csv';
ambientData = csvread(csvAmbientData);

ambientMagnitudes = ambientData(:, 2 : end);

fireLabels = [];
ambientLabels = [];

for i = 1: length(fireMagnitudes)
    testMagnitudes = fireMagnitudes(:,i);
    distanceFromFire = 0;
    distanceFromAmbient = 0;
    for j = 1: length(trainedFireAverages)
        distanceFromFire = distanceFromFire + ((testMagnitudes(j) - trainedFireAverages(j)) ^ 2);
        distanceFromAmbient = distanceFromAmbient + ((testMagnitudes(j) - trainedAmbientAverages(j)) ^ 2);
    end
    
    minDistance = min(sqrt(distanceFromFire), sqrt(distanceFromAmbient));
    
    if minDistance == sqrt(distanceFromFire)
        fireLabels = [fireLabels, 1];
    else
        fireLabels = [fireLabels, 0];
    end
    
end

for i = 1: length(ambientMagnitudes)
    testMagnitudes = ambientMagnitudes(:,i);
    distanceFromFire = 0;
    distanceFromAmbient = 0;
    for j = 1: length(trainedFireAverages)
        distanceFromFire = distanceFromFire + ((testMagnitudes(j) - trainedFireAverages(j)) ^ 2);
        distanceFromAmbient = distanceFromAmbient + ((testMagnitudes(j) - trainedAmbientAverages(j)) ^ 2);
    end
    
    minDistance = min(sqrt(distanceFromFire), sqrt(distanceFromAmbient));
    
    if minDistance == sqrt(distanceFromFire)
        ambientLabels = [ambientLabels, 1];
    else
        ambientLabels = [ambientLabels, 0];
    end
    
end

csvFireLabels = 'fire_labels.csv';
csvAmbientLabels = 'ambient_labels.csv';

csvwrite(csvFireLabels, fireLabels);
csvwrite(csvAmbientLabels, ambientLabels);
output = 1;
end