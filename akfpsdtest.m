[y, Fs] = audioread('EQ2401project1data2019.wav');
e = [y(1:4500); y(19000:26000); y(42000:51000)];

N = 16;
fftlen = 16;

ryy = autocorr(y, 'NumLags', N-1);
ree = autocorr(e, 'NumLags', N-1);

phiyy = fft(ryy, fftlen);
phiee = fft(ree, fftlen);
phixx = phiyy - phiee;

rxx = ifft(phixx);
rxx_dir = ryy-ree;