function AlgoEval(dsPca, knnClassifier)
    truth = dsPca.getTargets;
    yOutKfolds = knnClassifier.kfolds(dsPca, 10);

    [nVotes, guess] = max(yOutKfolds.getObservations,[], 2);
    
    figure(4)
    prtScoreConfusionMatrix(guess,truth,dsPca.uniqueClasses,dsPca.getClassNames);
    title('Classification Confusion Matrix');