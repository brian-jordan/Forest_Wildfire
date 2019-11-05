clear all;
close all;
clc;
format compact;

%% Initialize Variables
bool = 'T';
filenames = {};
targetvalues = [];
j =1;

%% User Inputs Files and Target Vals
while bool == 'T'
    prompt = 'Enter name of file \n';
    a = input(prompt, 's');
    filenames{j} = a;
    prompt1 = 'Enter target value (0 or 1) \n';
    b = input(prompt1);
    targetvalues(j) = b;
    prompt2 = 'More files? (y/n) \n';
    c = input(prompt2, 's');
    if c == 'n'
        bool = 'F';
    else
        j = j+1;
    end
end

%% Run PCA
prompt3 = 'Run PCA? (y/n) \n';
d = input(prompt3, 's');

if d == 'y'
    
    X = [];
    Y = [];
    
    %Concatanate all of the files together
    for i=1:length(filenames);
        [v, z] = LoadPRTData(filenames{i}, targetvalues(i));
        X = cat(1, X, v);
        Y = cat(1, Y, z);
    end
    
    dataSet = prtDataSetClass(X, Y);
    myPca = prtPreProcPca;
    prompt4 = 'How many principal components? \n';
    e = input(prompt4);
    myPca.nComponents = e;  %use the first 2 principal components
    
    % Train the PCA to learn the principal components of the data:
    %myPca = myPca + prtClassFld;
    myPca = myPca.train(dataSet);
    dsPca = myPca.run(dataSet);   %Run the PCA analysis on the data
    
    % plot the data.
     figure(1); plot(dsPca);
    
%       classifier = prtClassGlrt;              % Create a classifier
%       classifier = classifier.train(dsPca);    % Train
%       classifier.plot;
%       classified = classifier.run(dsPca);
%       subplot(2,1,1);
%       classifier.plot;
%       subplot(2,1,2);
%       [pf,pd] = prtScoreRoc(classified,dsPca);
%       h = plot(pf,pd,'linewidth',3);
%       title('ROC'); xlabel('Pf'); ylabel('Pd');

    
    knnClassifier = prtClassKnn;
    knnClassifier = knnClassifier.train(dsPca);
    figure(2);
    plot(knnClassifier);
    
%     knnClassifer.internalDecider = prtDecisionMap;
%     knnClassifier = knnClassifier.train(dsPca);
    
%     figure(3);
%     plot(knnClassifier);
    
end

%% Evaluate Classifier
prompt5 = 'Evaluate Classifier? (y/n) \n';
f = input(prompt5, 's');

if f == 'y'
    AlgoEval(dsPca, knnClassifier);
end 

