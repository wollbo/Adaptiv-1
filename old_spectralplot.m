function spectralplot(signal)

spectrum = abs(fft(signal));
vs = [0:1/length(spectrum):1];
plot(vs(1:round(length(spectrum)/2)), spectrum(1:round(end/2)))
end