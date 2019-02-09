function [xhat, H] = ncwiener(y, ryy, rxy)
assert (length(ryy) == length(rxy))
% xhat = filter(rxy, ryy, y);

%Get filter frequency response
% fftlen = 1024;
% phiyy = fft(ryy, fftlen);
% phixy = fft(rxy, fftlen);
% H = phixy ./ phiyy;

N = length(ryy);
%Old
fftlen = 2^(nextpow2(length(y) + length(ryy) - 1));

%phiyy = fft(ryy.*hanning(N), fftlen);
%phixy = fft(rxy.*hanning(N), fftlen);

phiyy = fft(ryy, fftlen);
phixy = fft(rxy, fftlen);

H = phixy ./ phiyy;
Y = fft(y, fftlen);
Xhat = Y .* H;
xhat = ifft(Xhat);
end