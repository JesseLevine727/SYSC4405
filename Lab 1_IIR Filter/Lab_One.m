%Generating Example Noisy Sine Wave

fs = 16e3;
t = 0:1/fs : 0.02;

s1 = 1.00 * sin(2*pi*150 * t);    
s2 = 0.05 * sin(2*pi*3304 * t);   
s3 = 0.02 * sin(2*pi*4000 * t);   
s4 = 0.04 * sin(2*pi*5722 * t);   
s5 = 0.07 * sin(2*pi*7302 * t);

sigsum = s1+s1+s3+s4+s5;

plot(t,sigsum);

%Performing Spectral Analysis in Matlab

plot(abs(fft(sigsum)))

plot(abs(fftshift(fft(sigsum))))

plotspectrum(sigsum,fs)

%figure(1); pspectrum(sigsum,fs)
%figure(2); periodogram(sigsum)
%figure(3); pwelch(sigsum)

%Example filter In Matlab

%Coefficients for lowpass filter

format long
b = [0.0355267, 0.0306650, 0.0581951, 0.0306650, 0.0355267];
a = [1, -2.1485451, 2.2390905, -1.1509858, 0.2532257]; %noticed rearranged sign

freqz(b,a)

W=0:pi/10000:pi;           % Define frequency range
H=freqz(b,a,W);            % Compute frequency response
plot(W*fs/(2*pi),abs(H));  % Plot magnitude of frequency response
title('Magnitude of Frequency Response');
grid on;
xlabel('Frequency (Hz)');
ylabel('Magnitude of H');


y = filter(b, a, sigsum);

plot(t, sigsum, 'b'); hold on;
plot(t, y, 'r'); hold off;

ylabel('Amplitude'); xlabel('Time (secs)'); 
grid on;
title('Plot of sigsum (blue) and lowpass filtered output (red)');