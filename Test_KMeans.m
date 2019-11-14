%% Test LDA Models

% CSV Files
csvFireDir = 'CSV_Fire_Files/';
csvAmbientDir = 'CSV_Forest_Files/';
csvFireResult = 'fire_magnitudes.csv';
csvAmbientResult = 'ambient_magnitudes.csv';

csvFireFrequencyDir = 'CSV_Fire_Frequencies/';
csvAmbientFrequencyDir = 'CSV_Ambient_Frequencies/';

X = [];
Y = [];
Z = [];

for binSize = 1 : 50

% binSize = 5;

% Uses CSV Frequency File Directory to create fire_magnitudes.csv and
% ambient_magnitudes.csv
csvFireFile = ['fire_magnitudes_' num2str(binSize) '.csv'];
csvFireResult = [csvFireFrequencyDir csvFireFile];
Group_Frequencies(csvFireDir, binSize, csvFireResult);
csvAmbientFile = ['ambient_magnitudes_' num2str(binSize) '.csv'];
csvAmbientResult = [csvAmbientFrequencyDir csvAmbientFile];
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

X = [X, fpr];
% True Positive Rate
Y = [Y, tpr];
Z = [Z, falseNegative];
end
figure(1);
plot(X,Y)
hold on
hline = refline(1, 0);
hline.Color = 'k';
hline.LineStyle = '--';
xlabel('False Positive Rate');
ylabel('True Positive Rate');
title('ROC Curve');

binSize = 1 : 50;
figure(2);
plot(binSize, Z);



