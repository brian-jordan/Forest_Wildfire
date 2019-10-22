function ret = audioSignalAnalyze(audioFile)
%audioSignalAnalyze takes in an audio input, splits it into ten second
%intervals and saves the Fourier transforms as .CSV files
%Takes in an audio file (mp3 or m4a) as an input

[y,Fs] = audioread(audioFile);
y = y(:);
name = audioFile;
fileNameLength = length(name);
csvDir = 'CSV_files/';

lowerHzLimit = 0;
upperHzLimit = 200;

%Number of full 10 second clips that can be acquired from the signal
numClips = floor(length(y)/(Fs*10))

for i = 0:numClips-1
    %Get 10 second clip
   firstIndex = i*Fs*10+1;
   lastIndex = firstIndex+Fs*10-1;
   temp = y(firstIndex:lastIndex);
   
   %Fourier Transform of Clip
   FFT = fftshift((fft(temp)));
   nfft = length(FFT);
   dF = Fs/nfft;
   x = -Fs/2:dF:Fs/2-dF;
   zeroIndex = find(x>lowerHzLimit, 1);
   upperIndex = find(x>upperHzLimit, 1);
   FFT = FFT(zeroIndex:upperIndex);
   x = x(zeroIndex:upperIndex);
%    figure(i+1);
   
   absFFT = abs(FFT);
   maxF = max(absFFT);
   normFFT = absFFT./maxF;
   
%    plot(x,normFFT);
%    xlabel('Frequency (Hz)');
%    ylabel('Magnitude');
   
   fileName = name(1:(fileNameLength - 4));
   csv_file = [csvDir fileName num2str(i+1) '_frequency.csv'];
   csvwrite(csv_file, [x' normFFT]);
    
end

ret = 1;

end