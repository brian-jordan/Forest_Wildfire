function [percentcorrect, falsealarm, missedfires] = Classifiers()
percentcorrect = [];
falsealarm = [];
missedfires = [];
classifierNames = {};


%% K-nearest neighbors classifier
knnClassifier = prtClassKnn + prtDecisionBinaryMinPe;
yOutDecision = kfolds(knnClassifier, dsPca, 10);

figure(4)
[a, b] = prtScoreConfusionMatrix(yOutDecision);
falsealarm(1) = a(1, 2)/b(1);
missedfires(1) = a(2, 1)/b(2);
pc = prtScorePercentCorrect(yOutDecision)*100;
percentcorrect(1) = pc;
title(sprintf('KNN Percent Correct: %.2f%%', pc));

%% Support vector machine classifier
svmClassifier = prtClassLibSvm + prtDecisionBinaryMinPe;
yOutDecision = kfolds(svmClassifier, dsPca, 10);

figure(5)
[a, b] = prtScoreConfusionMatrix(yOutDecision);
falsealarm(2) = a(1, 2)/b(1);
missedfires(2) = a(2, 1)/b(2);
pc = prtScorePercentCorrect(yOutDecision)*100;
percentcorrect(2) = pc;
title(sprintf('SVM Percent Correct: %.2f%%', pc));

%% Random Forest Classifier
tbcClassifier = prtClassTreeBaggingCap + prtDecisionBinaryMinPe;
yOutDecision = kfolds(tbcClassifier, dsPca, 10);

figure(6)
[a, b] = prtScoreConfusionMatrix(yOutDecision);
falsealarm(3) = a(1, 2)/b(1);
missedfires(3) = a(2, 1)/b(2);
pc = prtScorePercentCorrect(yOutDecision)*100;
percentcorrect(3) = pc;
title(sprintf('RF Percent Correct: %.2f%%', pc));

%% Generalized likelihood ratio test classifier
glrtClassifier = prtClassGlrt + prtDecisionBinaryMinPe;
yOutDecision = kfolds(glrtClassifier, dsPca, 10);

figure(7)
[a, b] = prtScoreConfusionMatrix(yOutDecision);
falsealarm(4) = a(1, 2)/b(1);
missedfires(4) = a(2, 1)/b(2);
pc = prtScorePercentCorrect(yOutDecision)*100;
percentcorrect(4) = pc;
title(sprintf('GLRT Percent Correct: %.2f%%', pc));

%% Fisher linear discriminant classifier
fldClassifier = prtClassFld + prtDecisionBinaryMinPe;
yOutDecision = kfolds(fldClassifier, dsPca, 10);

figure(8)
[a, b] = prtScoreConfusionMatrix(yOutDecision);
falsealarm(5) = a(1, 2)/b(1);
missedfires(5) = a(2, 1)/b(2);
pc = prtScorePercentCorrect(yOutDecision)*100;
percentcorrect(5) = pc;
title(sprintf('FLD Percent Correct: %.2f%%', pc));

%% Distance likelihood ratio test classifier
dlrtClassifier = prtClassDlrt + prtDecisionBinaryMinPe;
yOutDecision = kfolds(dlrtClassifier, dsPca, 10);

figure(9)
[a, b] = prtScoreConfusionMatrix(yOutDecision);
falsealarm(6) = a(1, 2)/b(1);
missedfires(6) = a(2, 1)/b(2);
pc = prtScorePercentCorrect(yOutDecision)*100;
percentcorrect(6) = pc;
title(sprintf('DLRT Percent Correct: %.2f%%', pc));

%% AdaBoost classifier
% adaboostClassifier = prtClassAdaBoostFastAuc + prtDecisionBinaryMinPe;
% yOutDecision = kfolds(adaboostClassifier, dsPca, 10);
%
% figure(10)
% [a, b] = prtScoreConfusionMatrix(yOutDecision);
% falsealarm(7) = a(1, 2)/b(1);
% missedfires(7) = a(2, 1)/b(2);
% pc = prtScorePercentCorrect(yOutDecision)*100;
% percentcorrect(7) = pc;
% title(sprintf('AdaBoost Percent Correct: %.2f%%', pc));

%% Naive Bayes classifier
nbClassifier = prtClassNaiveBayes + prtDecisionBinaryMinPe;
yOutDecision = kfolds(nbClassifier, dsPca, 10);

figure(11)
[a, b] = prtScoreConfusionMatrix(yOutDecision);
falsealarm(8) = a(1, 2)/b(1);
missedfires(8) = a(2, 1)/b(2);
pc = prtScorePercentCorrect(yOutDecision)*100;
percentcorrect(8) = pc;
title(sprintf('Naive Bayes Percent Correct: %.2f%%', pc));

%% Maximum a Posteriori classifier
mapClassifier = prtClassMap + prtDecisionBinaryMinPe;
yOutDecision = kfolds(mapClassifier, dsPca, 10);

figure(12)
[a, b] = prtScoreConfusionMatrix(yOutDecision);
falsealarm(9) = a(1, 2)/b(1);
missedfires(9) = a(2, 1)/b(2);
pc = prtScorePercentCorrect(yOutDecision)*100;
percentcorrect(9) = pc;
title(sprintf('MAP Percent Correct: %.2f%%', pc));

%% Kernel matched subspace detector classifier
kmsdClassifier = prtClassKmsd + prtDecisionBinaryMinPe;
yOutDecision = kfolds(kmsdClassifier, dsPca, 10);

figure(13)
[a, b] = prtScoreConfusionMatrix(yOutDecision);
falsealarm(10) = a(1, 2)/b(1);
missedfires(10) = a(2, 1)/b(2);
pc = prtScorePercentCorrect(yOutDecision)*100;
percentcorrect(10) = pc;
title(sprintf('KMSD Percent Correct: %.2f%%', pc));

%% Partial least squares discriminant classifier
plsdaClassifier = prtClassPlsda + prtDecisionBinaryMinPe;
yOutDecision = kfolds(plsdaClassifier, dsPca, 10);

figure(14)
[a, b] = prtScoreConfusionMatrix(yOutDecision);
falsealarm(11) = a(1, 2)/b(1);
missedfires(11) = a(2, 1)/b(2);
pc = prtScorePercentCorrect(yOutDecision)*100;
percentcorrect(11) = pc;
title(sprintf('PLSDA Percent Correct: %.2f%%', pc));

%% K-means protoypes classifier
kmeansClassifier = prtClassKmeansPrototypes + prtDecisionBinaryMinPe;
yOutDecision = kfolds(kmeansClassifier, dsPca, 10);

figure(15)
[a, b] = prtScoreConfusionMatrix(yOutDecision);
falsealarm(12) = a(1, 2)/b(1);
missedfires(12) = a(2, 1)/b(2);
pc = prtScorePercentCorrect(yOutDecision)*100;
percentcorrect(12) = pc;
title(sprintf('K-Means Percent Correct: %.2f%%', pc));

    

