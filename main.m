%% Setup
addpath('mfiles')
[z, Fs] = audioread('EQ2401project1data2019.wav');
[y,e] = separate(z);
N = 30;

[ryy, ree, rxx] = estimateakf(y, e, N);
[phiyynum, phiyyden, phieenum, phieeden, phixxnum, phixxden] = estimateSpectra(ryy, ree, rxx, N);

%% FIR-wiener
[xhatfir, H, theta] = firwiener (z, rxx, ryy);
plotFilterResults(z, e, xhatfir, H, Fs);

%%  C-wiener
[xhatc, H] = cwiener(z, phixxnum, phixxden, phiyynum, phiyyden);
plotFilterResults(z, e, xhatc, H, Fs);

%% NC-wiener
[xhatnc, H] = ncwiener(z, phixxnum, phixxden, phiyynum, phiyyden);
plotFilterResults(z, e, xhatnc, H, Fs);

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