function [xhat, H, thetaopt] = firwiener(y, rxy, ryy)
assert (length(ryy) == length(rxy))

sigmaYY = toeplitz(ryy);
sigmaYx = rxy;

thetaopt = sigmaYY \ sigmaYx;

xhat = filter(thetaopt, 1, y);

%Get filter frequency response
fftlen = 1024;
H = fft(thetaopt, fftlen);
end

