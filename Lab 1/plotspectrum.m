function plotspectrum(x,fs)
% This function plots the magnitude frequency spectrum of x.
%     x: data
%     fs: sampling rate (samples/second)

y = fft(x);                     % Perform a fast Fourier transform
n = length(y);
freqrange = (0:n-1)*fs/n-fs/2;  % Determine frequency index in Hz

if mod(n,2) ~= 0.     % check if n is odd
   % n is odd, so we must shift each index by half a spacing to
   % have zero lined up
   freqrange = freqrange + fs/(2*n);
end

plot(freqrange, fftshift(abs(y))/n);  % Plot the analog frequency spectrum
title('Spectrum of signal');
xlabel('Frequency (Hertz)');
ylabel('Magnitude');