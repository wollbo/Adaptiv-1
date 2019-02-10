%% Setup
addpath('mfiles')
clear
[z, Fs] = audioread('EQ2401project1data2019.wav');
[y,e] = separate(z);
N = 30;

[ryy, ree, rxx] = estimateakf(y, e, N);
[phiyynum, phiyyden, phieenum, phieeden, phixxnum, phixxden] = estimateSpectra(ryy, ree, rxx, N);

%% Plot Estimated Spectra
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


