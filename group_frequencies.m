%% Data Compression
% Get file to compress
csvTestFile = 'CSV_files/Fire_1_frequency.csv';

FrequencyData = csvread(csvTestFile);
frequency = FrequencyData(:,1);
magnitude = FrequencyData(:,2);

groupingSize = 100;
startingFrequency = 0;

minFrequency = [];
windowAverage = [];
sum = 0;
count = 0;

for i = 1 : length(frequency)
    if (frequency(i) < 0)
        continue
    end
    if (frequency(i) >= startingFrequency && frequency(i) < (startingFrequency + groupingSize))
        sum = sum + magnitude(i);
        count = count + 1;
    else
        minFrequency = [minFrequency startingFrequency];
        windowAverage = [windowAverage (sum / count)];
        sum = magnitude(i);
        count = 1;
        startingFrequency = startingFrequency + groupingSize;
    end
end