%% Fire Noise Data Compression
% Get file to compress
csvDirFile = 'CSV_Fire_Files/*.csv'; %'CSV_Forest_Files/*.csv'];
csvDir = 'CSV_Fire_Files/'; %'CSV_Forest_Files/'];
csvWriteFileName = 'fire_magnitudes.csv'; % 'forrest_magnitudes.csv'];
   
files = dir(csvDirFile);

maxFrequency = 200;
groupingSize = 5;

frequencyRange = (groupingSize: groupingSize : maxFrequency)';
condensedValueMatrix = frequencyRange;

for fileIter = 1 : length(files)
    FrequencyData = csvread([csvDir files(fileIter).name]);
    
    frequency = FrequencyData(:,1);
    magnitude = FrequencyData(:,2);
    
    currentFrequencyIndex = 1;
    
    windowAverage = [];
    
    sum = 0;
    count = 0;

    for i = 1 : length(frequency)
        if (frequency(i) <= frequencyRange(currentFrequencyIndex))
            sum = sum + magnitude(i);
            count = count + 1;
        else
            currentFrequencyIndex = currentFrequencyIndex + 1;
            windowAverage = [windowAverage (sum / count)];
            sum = magnitude(i);
            count = 1;
        end
    end
    
    windowAverage = [windowAverage (sum / count)];
    
    condensedValueMatrix = [condensedValueMatrix windowAverage'];
end
csvwrite(csvWriteFileName, condensedValueMatrix);