%% Spectrogram Audio Signal Analyzing Testing
clear
fireDir = 'fire_sounds/*.mp3';
fireFolder = 'fire_sounds/';
forestDir = 'forest_sounds/*.mp3';
forestFolder = 'forest_sounds/';

%Spectrograms, Frequency Domain and Time Domains of All Fire Audio Files
files = dir(fireDir)
N = length(files)
count = 1;
for i = 1:N
    name = files(i).name
    fileDir = [fireFolder name]
    [y,Fs] = audioread(fileDir);
    y = y(:);
    figure(count);
    count = count + 1;
    
    %Spectrogram
    subplot(1,3,1);
    spectrogram(y)
    title(name,'Interpreter', 'none');
    
    %Frequency Domain
    yFFT = fft(y);
    nfft = length(yFFT);
    x = Fs./2.*[-1:2./nfft:1-2./nfft];
    subplot(1,3,2);
    plot(x,abs(yFFT));
    title(name,'Interpreter', 'none');
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');
    
    %Time Domain
    x = 0:length(y)-1;
    subplot(1,3,3);
    plot(x,y);
    xlabel('Samples');
    ylabel('Magnitude');
    title(name,'Interpreter', 'none');
end

%Spectrograms of All Forest Audio Files
files = dir(forestDir)
N = length(files)
for i = 1:N
    name = files(i).name
    fileDir = [forestFolder name]
    [y,Fs] = audioread(fileDir);
    y = y(:);
    figure(count);
    count = count+1;
    spectrogram(y)
    title(name,'Interpreter', 'none');
end


%Forest-ambience.mp3 FFT
% [y,Fs] = audioread('forrest_sounds/Forest-ambience.mp3');
% y = y(:);
% y = fft(y);nfft = length(y);
% x = Fs./2.*[-1:2./nfft:1-2./nfft];
% plot(x,abs(y));
% title('Forest-ambience.mp3');
% xlabel('Frequency (Hz)');
% ylabel('Magnitude');
