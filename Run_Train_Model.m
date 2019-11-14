%% Run Model Trainer
%% Test Audio File
testAudioFile = 'audio_test.m4a';
csvWriteDir = 'CSV_Test_Files/';
csvResult = 'test_magnitudes.csv';
binSize = 5;

% Create Frequency CSV Files for Test Audio File
audioSignalAnalyze(testAudioFile, csvWriteDir);

Group_Frequencies(csvWriteDir, binSize, csvResult);