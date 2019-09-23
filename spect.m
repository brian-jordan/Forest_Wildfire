%% Spectrogram Audio Signal Analyzing Testing
clear
fireDir = "fire_sounds/";
forrestDir = "forrest_sounds/";

figure(1)

%forestfire.mp3 spectrogram
[y,Fs] = audioread('fire_sounds/forestfire.mp3');
y = y(:);
subplot(2,2,1);
spectrogram(y)
title('forestfire.mp3');

%brush_fire.mp3 spectrogram
[y,Fs] = audioread('fire_sounds/brush_fire.mp3');
y = y(:);
subplot(2,2,2);
spectrogram(y)
title('brush\_fire.mp3');

%Fire_1.mp3 spectrogram
[y,Fs] = audioread('fire_sounds/Fire_1.mp3');
y = y(:);
subplot(2,2,3);
spectrogram(y)
title('Fire\_1.mp3');

%Forest_Fire_1.mp3 spectrogram
[y,Fs] = audioread('fire_sounds/Forest_Fire_1.mp3');
y = y(:);
subplot(2,2,4);
spectrogram(y)
title('Forest\_Fire\_1.mp3');

figure(2)
[y,Fs] = audioread('forrest_sounds/Forest-ambience.mp3');
y = y(:);
spectrogram(y)
