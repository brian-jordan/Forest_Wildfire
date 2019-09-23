%% Spectrogram Audio Signal Analyzing Testing
clear
fireDir = 'fire_sounds/*.mp3';
fireFolder = 'fire_sounds/';
forestDir = 'forrest_sounds/*.mp3';
forestFolder = 'forrest_sounds/';

%Spectrograms of All Fire Audio Files
files = dir(fireDir)
N = length(files)
count = 1;
for i = 1:N
    name = files(i).name
    fileDir = ['fire_sounds/' name]
    [y,Fs] = audioread(fileDir);
    y = y(:);
    figure(count);
    spectrogram(y)
    title(name,'Interpreter', 'none');
    count = count+1;
end

figure(count)
count = count+1;

% %forestfire.mp3 spectrogram
% [y,Fs] = audioread('fire_sounds/forestfire.mp3');
% y = y(:);
% subplot(2,2,1);
% spectrogram(y)
% title('forestfire.mp3');
% 
% %brush_fire.mp3 spectrogram
% [y,Fs] = audioread('fire_sounds/brush_fire.mp3');
% y = y(:);
% subplot(2,2,2);
% spectrogram(y)
% title('brush\_fire.mp3');
% 
% %Fire_1.mp3 spectrogram
% [y,Fs] = audioread('fire_sounds/Fire_1.mp3');
% y = y(:);
% subplot(2,2,3);
% spectrogram(y)
% title('Fire\_1.mp3');
% 
% %Forest_Fire_1.mp3 spectrogram
% [y,Fs] = audioread('fire_sounds/Forest_Fire_1.mp3');
% y = y(:);
% subplot(2,2,4);
% spectrogram(y)
% title('Forest\_Fire\_1.mp3');

figure(2)
[y,Fs] = audioread('forrest_sounds/Forest-ambience.mp3');
y = y(:);
subplot(1,1,1);
spectrogram(y)
title('Forest-ambience.mp3');

%% Frequency Domain Audio Signal Analyzing Testing
figure(3)

%forestfire.mp3 FFT
[y,Fs] = audioread('fire_sounds/forestfire.mp3');
y = y(:);
y = fft(y);
nfft = length(y);
x = Fs./2.*[-1:2./nfft:1-2./nfft];
subplot(2,2,1);
plot(x,abs(y));
title('forestfire.mp3');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

%brush_fire.mp3 FFT
[y,Fs] = audioread('fire_sounds/brush_fire.mp3');
y = y(:);
y = fft(y);
nfft = length(y);
x = Fs./2.*[-1:2./nfft:1-2./nfft];
subplot(2,2,2);
plot(x,abs(y));
title('brush\_fire.mp3');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

%Fire_1.mp3 FFT
[y,Fs] = audioread('fire_sounds/Fire_1.mp3');
y = y(:);
y = fft(y);
nfft = length(y);
x = Fs./2.*[-1:2./nfft:1-2./nfft];
subplot(2,2,3);
plot(x,abs(y));
title('Fire\_1.mp3');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

%Forest_Fire_1.mp3 FFT
[y,Fs] = audioread('fire_sounds/Forest_Fire_1.mp3');
y = y(:);
y = fft(y);nfft = length(y);
x = Fs./2.*[-1:2./nfft:1-2./nfft];
subplot(2,2,4);
plot(x,abs(y));
title('Forest\_Fire\_1.mp3');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

figure(4)

%Forest-ambience.mp3 FFT
[y,Fs] = audioread('forrest_sounds/Forest-ambience.mp3');
y = y(:);
y = fft(y);nfft = length(y);
x = Fs./2.*[-1:2./nfft:1-2./nfft];
plot(x,abs(y));
title('Forest-ambience.mp3');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
