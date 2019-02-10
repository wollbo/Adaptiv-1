function [xhat, H] = cwiener (z, phixynum,phixyden,phiyynum,phiyyden)
m = 0;
[xhat,~,~] = cw(z,phixynum,phixyden,phiyynum,phiyyden,m);
dirac = zeros(10^3,1);
dirac(500) = 1;
h = cw(dirac,phixynum,phixyden,phiyynum,phiyyden,m);

H = fft(h, 1024);
end

