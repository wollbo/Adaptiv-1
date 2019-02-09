%Load Data
[z, Fs] = audioread('EQ2401project1data2019.wav');
%e = [y(1:4500); y(19000:26000); y(42000:51000)];
[y,e] = separate(z);

a = ar(y, 51);
b = ar(e, 51);
[ryy, rxy] = estimateakf(y, e, 51);

xhat = ncfilt(ryy-b.a, ryy, z);
dirac = zeros(10^3,1);
dirac(500) = 1;
h = ncfilt(b.a, a.a, dirac);
H = fft(h, 2024);

% M = 512;
% Pee = pwelch(e,blackman(M), M/2, 'twosided');
% Pyy = pwelch(y,blackman(M), M/2, 'twosided');
% pe = ifft(Pee);
% pe = pe(1:M/2);
% py = ifft(Pyy);
% py = py(1:M/2);

% welchhat = ncfilt(pe - py, py, z);
% xhat = welchhat;
%Apply Filter
%[ryy, rxy] = estimateakf(y, e, 51);
% [ehat, H] = ncwiener (z, ryy, rxy);
% xhat = z - ehat;



%Plot Filter Frequency Response
%plotFilterResponse(H, Fs);
plotFilterResults(z, e, xhat, H, Fs);