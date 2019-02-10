function [PhixyNum, PhixyDen, PhiyyNum, PhiyyDen] = spec_add(A, sigma2, Anoise, sigma2noise)

[PhixyNum, PhixyDen] = filtspec(1, A, sigma2)
[PhiyyNum, PhiyyDen] = filtspec(1, Anoise, sigma2noise)

end