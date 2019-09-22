clear
figure(1)
[y,Fs] = audioread('forestfire.mp3');
y = y(:);
spectrogram(y)

figure(2)
[y,Fs] = audioread('Forest-ambience.mp3');
y = y(:);
spectrogram(y)
