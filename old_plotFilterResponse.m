function plotFilterResponse(H, Fs)


N = length(H);

freqresp = abs(H(1:floor(N/2)+1));
plot(linspace(0, 0.5, floor(N/2)+1)*Fs, 10*log10(freqresp))

grid on
box off
xlabel('Frequency (Hz)')
ylabel('Magnitude (dB)')
end

