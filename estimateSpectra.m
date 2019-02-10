function [phiyynum, phiyyden, phieenum, phieeden] = estimateSpectra(y, e, N)

%ary = ar(y, N);
%are = ar(e, N);

ryy = xcorr(y, 'biased', N-1);
ree = xcorr(e, 'biased', N-1);
%mid = floor(length(ryy)/2)+1;
ryy = ryy(floor(length(ryy)/2)+1:end);
ree = ree(floor(length(ree)/2)+1:end);

[ary,Ey] = levinson(ryy, N-1);
[are,Ee] = levinson(ree, N-1);
sigy = ryy(1) - ary(2:end)*ryy(2:N);
sige = ree(1) - are(2:end)*ree(2:N);

[phiyynum, phiyyden] = filtspec(1,ary, sigy);
[phieenum, phieeden] = filtspec(1,are, sige);


end

