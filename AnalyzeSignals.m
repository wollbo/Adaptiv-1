%% Load Data
[z, Fs] = audioread('EQ2401project1data2019.wav');
[y,e] = separate(z);
<<<<<<< HEAD

%% Plot Spectra
noise_indexes = [1:4500 19000:26000 42000:51000];
y = z(noise_indexes);
figure()
hold on
grid on
box off


N = 512;
Pee = pwelch(e,blackman(N), N/2);
Pyy = pwelch(y,blackman(N), N/2);
%plot(linspace(0, Fs/2, N/2+1), 10*log10(Pee))
%plot(linspace(0, Fs/2, N/2+1), 10*log10(Pyy))
plot(linspace(0, Fs/2, N/2+1), Pee)
plot(linspace(0, Fs/2, N/2+1), Pyy)
legend('Noise', 'Speech and Noise')

%% Statistical Properties
me = mean(e);
my = mean(y);
vare = var(e);
vary = var(y);
fprintf('E[e(n)] = %f \nE[y(n)] = %f \n', me, my);
fprintf('var{e(n)} = %f \nvar{y(n)} = %f \n', vare, vary);

%% Frequency response of y over time
figure('Position', [100,100, 1500, 500])
framelen = floor(20e-3*Fs);
ulen = 64;
numAvg = 6;
avgCounter = 1;
fftlen = 1024;
prevFrames = zeros(fftlen, numAvg-1);
numFrames = floor((length(y)-framelen) / ulen) + 1;

for i = 1:numFrames
    subplot(1,2,2)

    n = (i-1)*ulen+1;
    
    frame = y(n:n+framelen-1).*hanning(framelen);
    freqresp = abs(fft(frame, fftlen)).^2;
    avgFreqresp = mean([freqresp, prevFrames], 2);
    
    prevFrames(:,avgCounter) = freqresp;
    avgCounter = mod(avgCounter,numAvg) + 1;
    
    plot(linspace(0,0.5*Fs, fftlen/2), 10*log10(avgFreqresp(1:fftlen/2)));
    grid on
    box off
    axis([0, 0.5*Fs, -30, 30]);
   
    
    subplot(1,2,1)
    plot(y);
    rectangle('Position', [n, min(y), framelen, max(y)-min(y)], 'FaceColor', [0.3 1 0.4 0.9], 'EdgeColor', [1 1 1, 0])
    axis off
    drawnow
end
