clear all;
close all;
clc;

%% Load Files and Make Dataset
filenames = {'fire_magnitudes.csv', 'ambient_magnitudes.csv'};
targetvalues = [1 0];
X = [];
Y = [];

%Concatanate all of the files together
for i=1:length(filenames)
    [feat, label] = LoadPRTData(filenames{i}, targetvalues(i));
    
    X = cat(1, X, feat);
    Y = cat(1, Y, label);
    
end

dataSet = prtDataSetClass(X, Y);

%% Run Principal Component Analysis to Reduce Dimensions
myPca = prtPreProcPca;
myPca.nComponents = 3;

% Train the PCA to learn the principal components of the data:
myPca = myPca.train(dataSet);
dsPca = myPca.run(dataSet);   %Run the PCA analysis on the data

figure(1)
clf
plot(dsPca);

%% Plot the Variance of PCA
pcaVar = prtPreProcPca;
pcaVar.nComponents = dataSet.nFeatures;
pcaVar = pcaVar.train(dataSet);

figure(2)
clf
stem(pcaVar.totalPercentVarianceCumulative,'linewidth',3);
xlabel('#Component;ls');
ylabel('Percent Variance Explained');
title('PCA Percent Variance Explained')

%% Run the Classifiers x amount of times
prompt = 'How many times to run? \n';
in = input(prompt);

%Set cell arrays
Names = {prtClassKnn, prtClassLibSvm, prtClassTreeBaggingCap, prtClassGlrt, prtClassFld,...
    prtClassDlrt, prtClassAdaBoostFastAuc, prtClassNaiveBayes, prtClassMap,...
    prtClassKmsd, prtClassPlsda, prtClassKmeansPrototypes};
Classifier = {'Knn', 'Svm', 'RF', 'Glrt', 'Fld', 'Dlrt', 'AdaBoost',...
    'NBayes', 'MaP', 'Kmsd', 'Plsda', 'Kmeans'};

%Initialize variables
Accuracy = zeros(12, 1);
False_Alarms = zeros(12, 1);
Missed_Fires = zeros(12, 1);
Run_Time = zeros(12, 1);

%Iterate through and collect evaluation data
for i=1:in
    [percentcorrect, falsealarm, missedfires, time2run] = Classifiers(dsPca, Names);
    falsealarm = falsealarm.*100;
    missedfires = missedfires.*100;
    Accuracy = percentcorrect + Accuracy;
    False_Alarms = falsealarm + False_Alarms;
    Missed_Fires = missedfires + Missed_Fires;
    Run_Time = time2run + Run_Time;
end

%Average data
Accuracy = Accuracy./in;
False_Alarms = False_Alarms./in;
Missed_Fires = Missed_Fires./in;
Run_Time = Run_Time./in;
Classifier = Classifier';

%Plot data in a table
T = table(Accuracy, False_Alarms, Missed_Fires, Run_Time);
T.Properties.RowNames = Classifier;
T.Properties.VariableUnits{'Accuracy'} = '%';
T.Properties.VariableUnits{'False_Alarms'} = '%';
T.Properties.VariableUnits{'Missed_Fires'} = '%';
T.Properties.VariableUnits{'Run_Time'} = 's';



