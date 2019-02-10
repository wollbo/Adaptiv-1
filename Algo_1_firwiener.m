%Load Data
[z, Fs] = audioread('EQ2401project1data2019.wav');
%e = [y(1:4500); y(19000:26000); y(42000:51000)];
e = z(42000:51000);
y = z([4501:18999 26001:41999 51001:length(y)]);

%Apply Filter
%[ryy, ree] = estimateakf(y, e, 3000);
[phiyynum, phiyyden, phieenum, phieeden, ryy, ree] = estimateSpectra(y,e,51, 1000);
%rxy = ryy - ree;
[ehat, H, theta] = firwiener (z, ryy, ree);
xhat = z - ehat;

%Plot Filter Frequency Response
%plotFilterResponse(H, Fs)
plotFilterResults(z, e, xhat, H, Fs)

