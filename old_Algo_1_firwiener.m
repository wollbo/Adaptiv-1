%Load Data
[z, Fs] = audioread('EQ2401project1data2019.wav');
%e = [y(1:4500); y(19000:26000); y(42000:51000)];
% e = z(42000:51000);
% y = z([4501:18999 26001:41999 51001:length(y)]);
[y,e] = separate(z);

%Apply Filter
[ryy, ree, rxx] = estimateakf(y, e, 500);
%[phiyynum, phiyyden, phieenum, phieeden, ryy, ree] = estimateSpectra(y,e,51, 50);
rxy = ryy - ree;
[xhat, H, theta] = firwiener (z, ryy, rxy);
%xhat = z - ehat;

%Plot Filter Frequency Response
%plotFilterResponse(H, Fs)
plotFilterResults(z, e, xhat, H, Fs)

