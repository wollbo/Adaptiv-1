function [xhat] = ncwiener(y, ryy, rxy)
assert (length(ryy) == length(rxy))
fftlen = length(y) + length(ryy) - 1;

phiyy = fft(ryy, fftlen);
phixy = fft(rxy, fftlen);

H = phixy ./ phiyy;
Y = fft(y, fftlen);
Xhat = Y .* H;
xhat = ifft(Xhat);
end

