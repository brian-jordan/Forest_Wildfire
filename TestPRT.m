clear all;
close all;
format compact;
clc;

dataSet = prtDataGenIris;
dataSet = dataSet.retainFeatures(1:3); %retain the first 3 dimensions of the Iris data
myPca = prtPreProcPca;
myPca.nComponents = 2;  %I'd like to use the first 2 principal components

% Train the PCA to learn the principal components of the data:
myPca = myPca.train(dataSet);
dsPca = myPca.run(dataSet);   %Run the PCA analysis on the data

% plot the data.
figure(1); plot(dataSet);
figure(2); plot(dsPca);

knnClassifier = prtClassKnn;
knnClassifier = knnClassifier.train(dsPca);
figure(3);
plot(knnClassifier);