%% Confusion Matrix
%% Input: Npredicted binary labels and Ntrue binary labels; Output: a 2×2 confusion matrix.

function [trueNegative, falsePositive, falseNegative, truePositive] = KNN_Analysis(binSize)

csvFireLabels = 'fire_labels.csv';
csvAmbientLabels= 'ambient_labels.csv';

fireLabels = csvread(csvFireLabels);
ambientLabels = csvread(csvAmbientLabels);

% Counts
truePositive = 0;
falsePositive = 0;
trueNegative = 0;
falseNegative = 0;

for i = 1: length(fireLabels)
    if fireLabels(1,i) == 1
        truePositive = truePositive + 1;
    else
        falseNegative = falseNegative + 1;
    end
end

for j = 1: length(ambientLabels)
    if ambientLabels(1,j) == 1
        falsePositive = falsePositive + 1;
    else
        trueNegative = trueNegative + 1;
    end
end

% Outputs confustion matrix
    
% fprintf('True Negative     False Positive\nFalse Negative     True Positive\n');
ConfusionMatrix = [trueNegative, falsePositive; falseNegative, truePositive];

% Plot Results
labels= {'True Negative','False Positive','False Negative','True Positive'};
data = [trueNegative, falsePositive, falseNegative, truePositive];
% bar(data);
% title('Analysis of LDA Model for Determining Fire Presence');
% ylabel('Number of Audio Signals Classified');
% set(gca,'xticklabel',labels);
end
