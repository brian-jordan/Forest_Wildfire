function [percentcorrect, falsealarm, missedfires, time2run] = Classifiers(dsPca, classifierNames)

percentcorrect = zeros(length(classifierNames), 1);
falsealarm = zeros(length(classifierNames), 1);
missedfires = zeros(length(classifierNames), 1);
time2run = zeros(length(classifierNames), 1);


%% K-nearest neighbors classifier
for i=1:length(classifierNames)
    tic;
    Classifier = classifierNames{i} + prtDecisionBinaryMinPe;
    yOutDecision = kfolds(Classifier, dsPca, 10);
    
    [a, b] = prtScoreConfusionMatrix(yOutDecision);
    falsealarm(i) = a(1, 2)/b(1);
    missedfires(i) = a(2, 1)/b(2);
    pc = prtScorePercentCorrect(yOutDecision)*100;
    percentcorrect(i) = pc;
    time2run(i) = toc;
end

% %% Support vector machine classifier
% tic;
% svmClassifier = prtClassLibSvm + prtDecisionBinaryMinPe;
% yOutDecision = kfolds(svmClassifier, dsPca, 10);
% 
% [a, b] = prtScoreConfusionMatrix(yOutDecision);
% falsealarm(2) = a(1, 2)/b(1);
% missedfires(2) = a(2, 1)/b(2);
% pc = prtScorePercentCorrect(yOutDecision)*100;
% percentcorrect(2) = pc;
% time2run(2) = toc;
% 
% %% Random Forest Classifier
% tic
% tbcClassifier = prtClassTreeBaggingCap + prtDecisionBinaryMinPe;
% yOutDecision = kfolds(tbcClassifier, dsPca, 10);
% 
% [a, b] = prtScoreConfusionMatrix(yOutDecision);
% falsealarm(3) = a(1, 2)/b(1);
% missedfires(3) = a(2, 1)/b(2);
% pc = prtScorePercentCorrect(yOutDecision)*100;
% percentcorrect(3) = pc;
% time2run(3) = toc;
% 
% %% Generalized likelihood ratio test classifier
% tic;
% glrtClassifier = prtClassGlrt + prtDecisionBinaryMinPe;
% yOutDecision = kfolds(glrtClassifier, dsPca, 10);
% 
% [a, b] = prtScoreConfusionMatrix(yOutDecision);
% falsealarm(4) = a(1, 2)/b(1);
% missedfires(4) = a(2, 1)/b(2);
% pc = prtScorePercentCorrect(yOutDecision)*100;
% percentcorrect(4) = pc;
% time2run(4) = toc;
% 
% %% Fisher linear discriminant classifier
% tic;
% fldClassifier = prtClassFld + prtDecisionBinaryMinPe;
% yOutDecision = kfolds(fldClassifier, dsPca, 10);
% 
% [a, b] = prtScoreConfusionMatrix(yOutDecision);
% falsealarm(5) = a(1, 2)/b(1);
% missedfires(5) = a(2, 1)/b(2);
% pc = prtScorePercentCorrect(yOutDecision)*100;
% percentcorrect(5) = pc;
% time2run(5) = toc;
% 
% %% Distance likelihood ratio test classifier
% tic;
% dlrtClassifier = prtClassDlrt + prtDecisionBinaryMinPe;
% yOutDecision = kfolds(dlrtClassifier, dsPca, 10);
% 
% [a, b] = prtScoreConfusionMatrix(yOutDecision);
% falsealarm(6) = a(1, 2)/b(1);
% missedfires(6) = a(2, 1)/b(2);
% pc = prtScorePercentCorrect(yOutDecision)*100;
% percentcorrect(6) = pc;
% time2run(6) = toc;
% 
% %% AdaBoost classifier
% tic;
% adaboostClassifier = prtClassAdaBoostFastAuc + prtDecisionBinaryMinPe;
% yOutDecision = kfolds(adaboostClassifier, dsPca, 10);
% 
% [a, b] = prtScoreConfusionMatrix(yOutDecision);
% falsealarm(7) = a(1, 2)/b(1);
% missedfires(7) = a(2, 1)/b(2);
% pc = prtScorePercentCorrect(yOutDecision)*100;
% percentcorrect(7) = pc;
% time2run(7) = toc;
% 
% %% Naive Bayes classifier
% tic;
% nbClassifier = prtClassNaiveBayes + prtDecisionBinaryMinPe;
% yOutDecision = kfolds(nbClassifier, dsPca, 10);
% 
% [a, b] = prtScoreConfusionMatrix(yOutDecision);
% falsealarm(8) = a(1, 2)/b(1);
% missedfires(8) = a(2, 1)/b(2);
% pc = prtScorePercentCorrect(yOutDecision)*100;
% percentcorrect(8) = pc;
% time2run(8) = toc;
% 
% %% Maximum a Posteriori classifier
% tic;
% mapClassifier = prtClassMap + prtDecisionBinaryMinPe;
% yOutDecision = kfolds(mapClassifier, dsPca, 10);
% 
% [a, b] = prtScoreConfusionMatrix(yOutDecision);
% falsealarm(9) = a(1, 2)/b(1);
% missedfires(9) = a(2, 1)/b(2);
% pc = prtScorePercentCorrect(yOutDecision)*100;
% percentcorrect(9) = pc;
% time2run(9) = toc;
% 
% %% Kernel matched subspace detector classifier
% tic;
% kmsdClassifier = prtClassKmsd + prtDecisionBinaryMinPe;
% yOutDecision = kfolds(kmsdClassifier, dsPca, 10);
% 
% [a, b] = prtScoreConfusionMatrix(yOutDecision);
% falsealarm(10) = a(1, 2)/b(1);
% missedfires(10) = a(2, 1)/b(2);
% pc = prtScorePercentCorrect(yOutDecision)*100;
% percentcorrect(10) = pc;
% time2run(10) = toc;
% 
% %% Partial least squares discriminant classifier
% tic;
% plsdaClassifier = prtClassPlsda + prtDecisionBinaryMinPe;
% yOutDecision = kfolds(plsdaClassifier, dsPca, 10);
% 
% [a, b] = prtScoreConfusionMatrix(yOutDecision);
% falsealarm(11) = a(1, 2)/b(1);
% missedfires(11) = a(2, 1)/b(2);
% pc = prtScorePercentCorrect(yOutDecision)*100;
% percentcorrect(11) = pc;
% time2run(11) = toc;
% 
% %% K-means protoypes classifier
% tic;
% kmeansClassifier = prtClassKmeansPrototypes + prtDecisionBinaryMinPe;
% yOutDecision = kfolds(kmeansClassifier, dsPca, 10);
% 
% [a, b] = prtScoreConfusionMatrix(yOutDecision);
% falsealarm(12) = a(1, 2)/b(1);
% missedfires(12) = a(2, 1)/b(2);
% pc = prtScorePercentCorrect(yOutDecision)*100;
% percentcorrect(12) = pc;
% time2run(12) = toc;

    


