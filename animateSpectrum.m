function animateSpectrum(signal, Fs)
figure('Position', [100,100, 1500, 500])
framelen = floor(20e-3*Fs);
ulen = 64;
numAvg = 10;
avgCounter = 1;
fftlen = 1024;
prevFrames = zeros(fftlen, numAvg-1);
numFrames = floor((length(signal)-framelen) / ulen) + 1;

for i = 1:numFrames
    subplot(2,1,2)
    n = (i-1)*ulen+1;
    
    frame = signal(n:n+framelen-1).*hanning(framelen);
    freqresp = abs(fft(frame, fftlen)).^2;
    avgFreqresp = mean([freqresp, prevFrames], 2);
    
    prevFrames(:,avgCounter) = freqresp;
    avgCounter = mod(avgCounter,numAvg) + 1;
    
    plot(linspace(0,0.5*Fs, fftlen/2), 10*log10(avgFreqresp(1:fftlen/2)));
    grid on
    box off
    axis([0, 0.5*Fs, -30, 30]);
    xlabel('Frequency (Hz)')
    ylabel('\(\Phi_{yy}(\nu)\)')
    
    subplot(2,1,1)
    plot(signal);
    xlim([1, length(signal)]);
    rectangle('Position', [n, min(signal), framelen, max(signal)-min(signal)], 'FaceColor', [0.6 0.7 0.6 0.4], 'EdgeColor', [1 1 1, 0])
    rectangle('Position', [max(0,n-(framelen*numAvg)), min(signal), max(min(numAvg*framelen, n),0), max(signal)-min(signal)],...
                            'FaceColor', [0.6 0.7 0.6 0.4], 'EdgeColor', [1 1 1, 0])
    axis off
    drawnow
end
end

