%Load Data
[z, Fs] = audioread('EQ2401project1data2019.wav');
%e = [y(1:4500); y(19000:26000); y(42000:51000)];
[y,e] = separate(z);

%Apply Filter
[ryy, rxy] = estimateakf(y, e, 3000);
[xhat, H, theta] = firwiener (z, ryy, rxy);


%Plot Filter Frequency Response
%plotFilterResponse(H, Fs)
plotFilterResults(z, xhat, H, Fs)

