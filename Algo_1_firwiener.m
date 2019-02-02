
[y, Fs] = audioread('EQ2401project1data2019.wav');
e = y(42000:51000);


[ryy, rxy] = estimateakf(y, e, 16);
[xhat, firparams] = firwiener (y, ryy, rxy);
