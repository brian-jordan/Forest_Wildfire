%% Confusion Matrix
%% Input: Npredicted binary labels and Ntrue binary labels; Output: a 2�2 confusion matrix.

csvFireLabels = 'fire_labels.csv';
csvAmbientLabels= 'ambient_labels.csv';

fireLabels = csvread(csvFireLabels);
ambientLabels = csvread(csvAmbientLabels);

% Given
trueValues = [1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0];
predictedValues = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

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
    
fprintf('True Negative     False Positive\nFalse Negative     True Positive\n');
ConfusionMatrix = [trueNegative, falsePositive; falseNegative, truePositive]

bar([trueNegative, falsePositive, falseNegative, truePositive])