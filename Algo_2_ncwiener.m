%Load Data
[y, Fs] = audioread('EQ2401project1data2019.wav');
e = [y(1:4500); y(19000:26000); y(42000:51000)];

%Apply Filter
[ryy, rxy] = estimateakf(y, e, 51);
[xhat, H] = ncwiener (y, ryy, rxy);

xhattest = filter(rxy, ryy, y);


%Plot Filter Frequency Response
plotFilterResponse(H, Fs)
