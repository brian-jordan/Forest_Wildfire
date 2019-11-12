%% Fire Noise Data Compression

function output = GroupFireFrequencies(input)
% Get files to compress
csvDirFile = 'CSV_Fire_Files/*.csv';
csvDir = 'CSV_Fire_Files/';
output = 'fire_magnitudes.csv';
   
files = dir(csvDirFile);

maxFrequency = 200;
input = 5;

frequencyRange = (input: input : maxFrequency)';
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
csvwrite(output, condensedValueMatrix);
end