%Load Data
[y, Fs] = audioread('EQ2401project1data2019.wav');
e = [y(1:4500); y(19000:26000); y(42000:51000)];

%Apply Filter
[ryy, rxy] = estimateakf(y, e, 150);
[xhat, firparams] = firwiener (y, ryy, rxy);


%Plot Filter Frequency Response
fftlen = 1024;
H = fft(firparams, fftlen);
plotFilterResponse(H, Fs)


