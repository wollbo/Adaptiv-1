%Load Data
[z, Fs] = audioread('EQ2401project1data2019.wav');
%e = [y(1:4500); y(19000:26000); y(42000:51000)];
[y,e] = separate(z);

[ryy, ree] = estimateakf(y, e, 100);
ary = ar(y, 41);
are = ar(e, 41);
%ryy = ar2cov(ary.a, var(y), 250);
%ree = ar2cov(are.a, var(e), 250);

%0.0012
%0.0049

[phienum, phieden] = filtspec(are.a,1, 0.004);
[phiynum, phiyden] = filtspec(ary.a,1, 0.008);
[numxy, denxy]=add(phiynum,phiyden,-phienum,phieden);

num = conv(numxy, phiyden);
den = conv(denxy, phiynum);

xhat = ncfilt(num, den, z);
dirac = zeros(10^3,1);
dirac(500) = 1;
h = ncfilt(num, den, dirac);
H = fft(h, 2024);

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