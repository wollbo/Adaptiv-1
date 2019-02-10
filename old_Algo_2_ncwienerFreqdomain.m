%Load Data
[z, Fs] = audioread('EQ2401project1data2019.wav');
[y,e] = separate(z);

phiy = abs(fft(y, 2^17)).^2;
phie = abs(fft(e, 2^17)).^2;
H = (phiy - phie)./ phiy;

M = 128;
Pe = pwelch(e,hanning(M), M/2, 2^17, 'twosided');
Py = pwelch(y,hanning(M), M/2, 2^17, 'twosided');
Hw = (Py - Pe) ./ Py;
%h = ifft(Hw);
%Hw = fft(h, 2^17);

Z = fft(z, 2^17);
Xhat = Z.*Hw;
xhat = ifft(Xhat);
plotFilterResults(z, e, xhat, Hw, Fs)