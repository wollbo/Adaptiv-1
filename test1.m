%% spectrum of whole sequence %%



[z, fs] = audioread('EQ2401project1data2019.wav');

%%

vs = [0:1/length(z):1];

plot(vs(1:end-1), abs(fft(data)))