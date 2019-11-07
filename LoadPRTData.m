function [dataSet, labelMat] = LoadPRTData(file, target)


% observations are in matrix of nObservations and nFeatures
% nObservations is number of samples. nFeatures is how many frequency
% averages are included

%labels are target=1 (fire) or nontarget = 0 (not a fire)

file = load(file);
dataSet = file';
dataSet(1, :) = [];

if target == 1
    labelMat = ones(length(dataSet(:,1)), 1);
else
    labelMat = zeros(length(dataSet(:,1)), 1);
end 



