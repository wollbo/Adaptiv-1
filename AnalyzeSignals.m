%Load Data
[y, Fs] = audioread('EQ2401project1data2019.wav');
[y,e] = separate(y);

figure()
hold on
grid on
box off

%Plot Spectra
N = 512;
Pee = pwelch(e,blackman(N), N/2);
Pyy = pwelch(y,blackman(N), N/2);
plot(linspace(0, Fs/2, N/2+1), 10*log10(Pee))
plot(linspace(0, Fs/2, N/2+1), 10*log10(Pyy))
legend('Noise', 'Speech and Noise')

%Statistical Properties
me = mean(e);
my = mean(y);
vare = var(e);
vary = var(y);
fprintf('E[e(n)] = %f \nE[y(n)] = %f \n', me, my);
fprintf('var{e(n)} = %f \nvar{y(n)} = %f \n', vare, vary);

%Frequency response of y over time
figure('Position', [100,100, 1500, 500])
framelen = floor(20e-3*Fs);
ulen = 32;
numFrames = floor((length(y)-framelen) / ulen) + 1;
fftlen = 1024;
for i = 1:numFrames
    subplot(1,2,2)
    n = (i-1)*ulen+1;
    frame = y(n:n+framelen);
    freqresp = abs(fft(frame, fftlen)).^2;
    
    plot(linspace(0,0.5*Fs, fftlen/2), 10*log10(freqresp(1:fftlen/2)));
    axis([0, 0.5*Fs, -30, 30]);
   
    
    subplot(1,2,1)
    plot(y);
    rectangle('Position', [n, -30, framelen, 60], 'FaceColor', [0.5 0.5 0.5 0.5], 'EdgeColor', [1 1 1])
    drawnow
end
