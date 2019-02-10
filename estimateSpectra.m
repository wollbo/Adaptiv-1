function [phiyynum, phiyyden, phieenum, phieeden, phixxnum, phixxden] = estimateSpectra(ryy, ree, rxx, Nar)

[ary,~] = levinson(ryy, Nar-1);
[are,~] = levinson(ree, Nar-1);
[arx,~] = levinson(rxx, Nar-1);
sigy = ryy(1) - ary(2:end)*ryy(2:Nar);
sige = ree(1) - are(2:end)*ree(2:Nar);
sigx = rxx(1) - arx(2:end)*rxx(2:Nar);

[phiyynum, phiyyden] = filtspec(1,ary, sigy);
[phieenum, phieeden] = filtspec(1,are, sige);
[phixxnum, phixxden] = filtspec(1,arx, sigx);
end

