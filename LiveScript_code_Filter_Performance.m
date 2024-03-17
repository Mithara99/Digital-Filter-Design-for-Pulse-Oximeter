%Livescript Code
[y, fs] = audioread('Heartbeat.wav');
y = y(:,1);
n = length(y);
t = (0:n-1)/fs;
plot(t,y)
title('Heartbeat Signal (with noise) in Time'); 
xlabel('time (s)'); ylabel('amplitude') 

%transform to frequency domain
Y = fft(y);
fs = 300000;
f = linspace(0,fs,length(y));
plot(f,abs(Y))
title('Heartbeat Signal (with noise) in Frequency'); xlim([0,2000]);
ylim([0,6000]); 
xlabel('frequency (Hz)'); ylabel('amplitude')

%Filter design
filterDesigner
FilteredSignal = filter(Hd,y);
FilteredSignalTransform = fft(FilteredSignal);

%Compare the filtered signals in frequency
f = linspace(0,fs,length(FilteredSignal));
plot(f,abs(FilteredSignalTransform))
title('Filtered Signal in Frequency'); xlim([0,2000]);
ylim([0,6000]);
xlabel('frequency (Hz)'); ylabel('amplitude')
