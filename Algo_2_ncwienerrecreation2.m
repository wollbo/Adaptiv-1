%Load Data
[z, Fs] = audioread('EQ2401project1data2019.wav');
%e = [y(1:4500); y(19000:26000); y(42000:51000)];
[y,e] = separate(z);

% [ryy, ree] = estimateakf(y, e, 100);
% ary = ar(y, 60);
% are = ar(e, 60);
% 
% [num, den] = filtspec(ary.a,are.a, 1);
%[numxy, denxy]=add(phiynum,phiyden,-phienum,phieden);

%num = conv(numxy, phiyden);
%den = conv(denxy, phiynum);
[phiyynum, phiyyden, phieenum, phieeden] = estimateSpectra(y,e,30);
[phixynum, phixyden]=add(phiyynum,phiyyden,-phieenum,phieeden);
Hnum = conv(phixynum, phiyyden);
Hden = conv(phiyynum, phixyden);

xhat = ncfilt(Hnum, Hden, z);
dirac = zeros(10^3,1);
dirac(500) = 1;
h = ncfilt(Hnum, Hden, dirac);
H = fft(h, 2024);
%xhat = z - ehat;
% M = 128;
% Pee = pwelch(e,blackman(M), M/2, 'twosided');
% Pyy = pwelch(y,blackman(M), M/2, 'twosided');
% pe = ifft(Pee);
% pe = pe(1:M/2);
% py = ifft(Pyy);
% py = py(1:M/2);
% ehat = ncfilt(pe, py, z);
% xhat = z - ehat;
% 
% dirac = zeros(10^3,1);
% dirac(500) = 1;
% h = ncfilt(pe, py, dirac);
% H = fft(h, 2024);

% welchhat = ncfilt(pe - py, py, z);
% xhat = welchhat;
%Apply Filter
%[ryy, rxy] = estimateakf(y, e, 51);
% [ehat, H] = ncwiener (z, ryy, rxy);
% xhat = z - ehat;



%Plot Filter Frequency Response
%plotFilterResponse(H, Fs);
plotFilterResults(z, e, xhat, H, Fs);