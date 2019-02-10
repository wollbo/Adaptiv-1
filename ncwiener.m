function [xhat, H] = ncwiener(z, phixynum, phixyden, phiyynum, phiyyden)

Hnum = conv(phixynum, phiyyden);
Hden = conv(phixyden, phiyynum);
[Hnum,Hden]=rmczeros(Hnum,Hden);

xhat = ncfilt(Hnum, Hden, z);
dirac = zeros(10^3,1);
dirac(500) = 1;
h = ncfilt(Hnum, Hden, dirac);
H = fft(h, 2024);
end

