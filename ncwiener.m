function [xhat, H] = ncwiener(y, ryy, rxy)
assert (length(ryy) == length(rxy))
fftlen = 2^nextpow2(length(y) + length(ryy) - 1);

phiyy = fft(ryy, fftlen);
phixy = fft(rxy, fftlen);

H = phixy ./ phiyy;
Y = fft(y, fftlen);
Xhat = Y .* H;
xhat = ifft(Xhat);


end