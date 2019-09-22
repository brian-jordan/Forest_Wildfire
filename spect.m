%% Spectrogram Audio Signal Analyzing Testing
clear
fireDir = "fire_sounds/";
forrestDir = "forrest_sounds/";

figure(1)
[y,Fs] = audioread('fire_sounds/forestfire.mp3');
y = y(:);
spectrogram(y)

figure(2)
[y,Fs] = audioread('forrest_sounds/Forest-ambience.mp3');
y = y(:);
spectrogram(y)
