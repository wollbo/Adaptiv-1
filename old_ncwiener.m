function [xhat, H] = ncwiener(y, ryy, rxy)
assert (length(ryy) == length(rxy))
% xhat = filter(rxy, ryy, y);

%Get filter frequency response
% fftlen = 1024;
% phiyy = fft(ryy, fftlen);
% phixy = fft(rxy, fftlen);
% H = phixy ./ phiyy;

xhat = ncfilt(rxy, ryy, y);

dirac = zeros(10^5,1);
dirac(5000) = 1;
h = ncfilt(rxy, ryy, dirac);
H = fft(h, 10^5);

%Old
% fftlen = 2^(nextpow2(length(y) + length(ryy) - 1));
% % 
% phiyy = fft(ryy, fftlen);
% phixy = fft(rxy, fftlen);
% 
% H = phixy ./ phiyy;
% Y = fft(y, fftlen);
% Xhat = Y .* H;
% xhat = ifft(Xhat);
end