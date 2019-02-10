%% Load Data
addpath('mfiles')
clear
[z,Fs] = audioread('EQ2401project1data2019.wav');
[y,e] = separate(z);

%% Plot Spectra
figure()
hold on
grid on
box off

M = 512;
Pee = pwelch(e,blackman(M), M/2);
Pyy = pwelch(y,blackman(M), M/2);
plot(linspace(0, Fs/2, M/2+1), 10*log10(Pee))
plot(linspace(0, Fs/2, M/2+1), 10*log10(Pyy))
legend('Noise', 'Speech and Noise')
hold off

%% Statistical Properties
me = mean(e);
my = mean(y);
vare = var(e);
vary = var(y);
fprintf('E[e(n)] = %f \nE[y(n)] = %f \n', me, my);
fprintf('var{e(n)} = %f \nvar{y(n)} = %f \n', vare, vary);

%% Frequency response of e over time
animateSpectrum(e, Fs)

%% Frequency response of y over time
animateSpectrum(y, Fs)




%% Estimate Spectra
N = 30;

[ryy, ree, rxx] = estimateakf(y, e, N);
[phiyynum, phiyyden, phieenum, phieeden, phixxnum, phixxden] = estimateSpectra(ryy, ree, rxx, N);

plotSpec(phiyynum, phiyyden, phieenum, phieeden, phixxnum, phixxden, Fs);

%% FIR-wiener
[xhatfir, H, theta] = firwiener (z, rxx, ryy);
plotFilterResults(z, e, xhatfir, H, Fs, 'FIR');

%%  C-wiener
[xhatc, H] = cwiener(z, phixxnum, phixxden, phiyynum, phiyyden);
plotFilterResults(z, e, xhatc, H, Fs, 'IIR Causal');

%% NC-wiener
[xhatnc, H] = ncwiener(z, phixxnum, phixxden, phiyynum, phiyyden);
plotFilterResults(z, e, xhatnc, H, Fs, 'IIR Non-Causal');

%% Listen
audioLength = length(z) / Fs;
soundsc(z);
pause(audioLength + 2);
soundsc(xhatfir);
pause(audioLength + 2);
soundsc(xhatc);
pause(audioLength + 2);
soundsc(xhatnc);
pause(audioLength + 2);

