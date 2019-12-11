%% Test Audio File

testAudioFile = 'Fire.m4a';
csvWriteDir = 'CSV_Fire_Test_Files/';
csvResult = 'fire_test_magnitudes.csv';
binSize = 5;

% Create Frequency CSV Files for Test Audio File
audioSignalAnalyze(testAudioFile, csvWriteDir);

Group_Frequencies(csvWriteDir, binSize, csvResult);