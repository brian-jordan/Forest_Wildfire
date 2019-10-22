%% Data Compression
% Get file to compress
csvDir = 'CSV_files/';
files = dir(csvDir);

maxFrequency = 200;
groupingSize = 5;

frequencyRange = (0: groupingSize : maxFrequency)';
condensedValueMatrix = frequencyRange;

for fileIter = 1 : length(files)
    FrequencyData = csvread(csvTestFile);
    
    frequency = FrequencyData(:,1);
    magnitude = FrequencyData(:,2);
    
    currentFrequencyIndex = 1;
    
    windowAverage = [];
    
    sum = 0;
    count = 0;

    for i = 1 : length(frequency)
        if (frequency(i) >= frequencyRange(currentFrequencyIndex) && ((currentFrequencyIndex + 1) > length(frequency) || frequency(i) < frequencyRange(currentFrequencyIndex + 1)))
            sum = sum + magnitude(i);
            count = count + 1;
        else
            currentFrequencyIndex = currentFrequencyIndex + 1;
            windowAverage = [windowAverage (sum / count)];
            sum = magnitude(i);
            count = 1;
        end
    end
    
    condensedValueMatrix = [condensedValueMatrix windowAverage'];
    
end

csvFile = 'fire_magnitudes.csv';
csvwrite(csvFile,condensedValueMatrix);