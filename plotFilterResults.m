function plotFilterResults(z, e, xhat, H, Fs)
figure()
numVer = 4;
numHor = 2;

%Original signal
subplot(numVer,numHor,1)
plot(z ./ max(z))
grid on
box off
title('Original Signal')

%Filtered signal
subplot(numVer,numHor,2)
plot(xhat ./ max(xhat))
grid on
box off
title('Filtered Signal')

%Frequency response of filter
subplot(numVer,numHor,3)
N = length(H);
freqresp = abs(H(1:floor(N/2)+1));
plot(linspace(0, 0.5, floor(N/2)+1)*Fs, 10*log10(freqresp))
title('Filter Frequency Response')

grid on
box off
xlabel('Frequency (Hz)')
ylabel('Magnitude (dB)')

%Impulse response of filter
subplot(numVer,numHor,4)
h = ifft(H);
plot(h);
grid on
box off
title('Filter Impulse Response')

%Spectrum of original signal
subplot(numVer,numHor,5)
framelen = 2048;
fftlen = 2048;
Pz = pwelch(z, hanning(framelen), framelen/2, fftlen);
plot(linspace(0, 0.5*Fs, length(Pz)), 10*log10(Pz))
box off
grid on
title('Spectrum Original Signal')

%Spectrum of filtered signal
subplot(numVer,numHor,6)
Pxhat = pwelch(xhat, hanning(framelen), framelen/2, fftlen);
plot(linspace(0, 0.5*Fs, length(Pxhat)), 10*log10(Pxhat))
box off
grid on
title('Spectrum Filtered Signal')

subplot(numVer, numHor, 7)
Pe = pwelch(e, hanning(framelen), framelen/2, fftlen);
plot(linspace(0, 0.5*Fs, length(Pe)), 10*log10(Pe))
box off
grid on
title('Spectrum Noise')

end

