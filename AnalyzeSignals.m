%% Load Data
[z, Fs] = audioread('EQ2401project1data2019.wav');
[y,e] = separate(z);
%% Plot Spectra
figure()
hold on
grid on
box off


N = 512;
Pee = pwelch(e,blackman(N), N/2);
Pyy = pwelch(y,blackman(N), N/2);
plot(linspace(0, Fs/2, N/2+1), 10*log10(Pee))
plot(linspace(0, Fs/2, N/2+1), 10*log10(Pyy))
legend('Noise', 'Speech and Noise')
hold off
%matlab2tikz('figures/rawSignalSpectra.tex', 'width', '0.7\linewidth');


%% Statistical Properties
[y,e] = separate(z);
me = mean(e);
my = mean(y);
vare = var(e);
vary = var(y);
fprintf('E[e(n)] = %f \nE[y(n)] = %f \n', me, my);
fprintf('var{e(n)} = %f \nvar{y(n)} = %f \n', vare, vary);

%% Frequency response of y over time
animateSpectrum(y, Fs)

%% Frequency response of e over time
animateSpectrum(e, Fs)