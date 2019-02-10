[z, Fs] = audioread('EQ2401project1data2019.wav');
[y,e] = separate(z);


% [ryy, ree] = estimateakf(y, e, 50);
% rxy = ryy - ree;
% [xhat, H] = cwiener(z, ryy, rxy);
% soundsc(xhat)
% plotFilterResults(z, e, xhat, H, Fs)


% [phiyynum, phiyyden, phieenum, phieeden, ryy, ree] = estimateSpectra(y,e, 30, 31);
% %[phixynum, phixyden]=add(phiyynum,phiyyden,-phieenum,phieeden);
% phixynum = phieenum;
% phixyden = phieeden;
% m = 0;
% [xhat,num,den] = cw(z,phiyynum,phiyyden,phixynum,phixyden,m);
% dirac = zeros(10^3,1);
% dirac(500) = 1;
% h = cw(dirac,phiyynum,phiyyden,phixynum,phixyden,m);

[phiyynum, phiyyden, phieenum, phieeden, phixxnum, phixxden, ryy, ree] = estimateSpectra(y,e,35, 51);
phixynum = phixxnum;
phixyden = phixxden;


m = 0;
[xhat,num,den] = cw(z,phixynum,phixyden,phiyynum,phiyyden,m);
dirac = zeros(10^3,1);
dirac(500) = 1;
h = cw(dirac,phixynum,phixyden,phiyynum,phiyyden,m);

H = fft(h, 1024);
plotFilterResults(z, e, xhat, H, Fs)