%Load Data
[y, Fs] = audioread('EQ2401project1data2019.wav');
e = [y(1:4500); y(19000:26000); y(42000:51000)];



% N = 2^nextpow2(length(e));
% noiseSpec = abs(fft(e, N));
% noiseSpec = noiseSpec(1:floor(N/2)+1);
% noiseSpec = 10*log10(noiseSpec);

N = 2048;
Pee = pwelch(e,blackman(N), N/2);
%plot(linspace(0, Fs/2, floor(N/2)+1), noiseSpec)
plot(linspace(0, Fs/2, N/2+1), 10*log10(Pee))
grid on
box off