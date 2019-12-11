%% Test LDA Models

% CSV Files
csvFireDir = 'CSV_Fire_Files/';
csvAmbientDir = 'CSV_Forest_Files/';
csvFireResult = 'fire_magnitudes.csv';
csvAmbientResult = 'ambient_magnitudes.csv';

csvFireFrequencyDir = 'CSV_Fire_Frequencies/';
csvAmbientFrequencyDir = 'CSV_Ambient_Frequencies/';

truePositiveRates = [];
falsePositiveRates = [];
falseNegatives = [];
falsePositives = [];

for binSize = 1 : 50

% binSize = 19;

% Uses CSV Frequency File Directory to create fire_magnitudes.csv and
% ambient_magnitudes.csv


% For Setting Matrix files for different bin sizes
% csvFireFile = ['fire_magnitudes_' num2str(binSize) '.csv'];
% csvAmbientFile = ['ambient_magnitudes_' num2str(binSize) '.csv'];
% csvFireResult = [csvFireFrequencyDir csvFireFile];
% csvAmbientResult = [csvAmbientFrequencyDir csvAmbientFile];

Group_Frequencies(csvFireDir, binSize, csvFireResult);
Group_Frequencies(csvAmbientDir, binSize, csvAmbientResult);

% Uses fire_magnitudes.csv and ambient_magnitudes.csv to create
% fire_trained.csv and ambient_trained.csv
frequencyClustering();

% Uses fire_trained.csv, ambient_trained.csv to classify frequency samples
% from fire_magnitudes.csv and ambient_magnitudes.csv to create
% fire_labels.csv and ambient_labels.csv
frequency_KMeans();

% Uses fire_labels.csv and ambient_labels.csv to assess the accuracy of the
% classifications
% output = [trueNegative, falsePositive, falseNegative, truePositive]
[trueNegative, falsePositive, falseNegative, truePositive] = KMeans_Analysis(binSize);

tpr = (truePositive / (truePositive + falseNegative));
fpr = (falsePositive /(trueNegative + falsePositive));

% False Positive Rate
falsePositiveRates = [falsePositiveRates, fpr];
% True Positive Rate
truePositiveRates = [truePositiveRates, tpr];
% False Negative Value
falseNegatives = [falseNegatives, falseNegative];
% True Negative Value
falsePositives = [falsePositives, falsePositive];end
minFN = min(falseNegatives);
possibleMinFP = [];
possibleMinFPIndex = [];

for iter = 1 : 50
    if falseNegatives(iter) == minFN
        possibleMinFP = [possibleMinFP, falsePositives(iter)];
        possibleMinFPIndex = [possibleMinFPIndex, iter];
    end
end
[minFP, minFPIndex] = min(possibleMinFP);

totalMinIndex = possibleMinFPIndex(minFPIndex)

% totalNegatives = falseNegatives + falsePositives;
% [minVal, index] = min(totalNegatives)

figure(1);
plot(falsePositiveRates, truePositiveRates)
hold on
hline = refline(1, 0);
hline.Color = 'k';
hline.LineStyle = '--';
xlabel('False Positive Rate');
ylabel('True Positive Rate');
title('ROC Curve');

binSizes = 1 : 50;
figure(2);
plot(binSizes, falseNegatives);
title('False Classifications Results for Varying Bin Size');
xlabel('Frequency Bin Size (Hz)');
ylabel('Number of Classifications');
hold on

plot(binSizes, falsePositives);
hold on

lineX = totalMinIndex;
lineY = 0 : max(falsePositives);
line([totalMinIndex, totalMinIndex], [0, 70], 'Color','black','LineStyle','--');
legend('False Negatives', 'False Positives', 'Minimum Error Binsize');