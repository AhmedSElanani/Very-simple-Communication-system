%%  Very simple communication system 
clear all;
close all;
clc;
%%  1. Transmitter

%   read the audio file
[y,Fs] = audioread('gs-16b-1c-44100hz.wav');
%{
    OR -- >    Ask the user for the File name
msg1 = 'Hello user, Please enter the Audio file name between '''' : ';
File_name = input(msg1);
[y,Fs] = audioread(File_name);
%}
%   Plot your sound file in time domain and the frequency domain
info = audioinfo('gs-16b-1c-44100hz.wav');
%   OR      info = audioinfo(File_name);
%   Create a vector t the same length as y, that represents elapsed time.
t = 0:(1/Fs):(info.Duration);
%t = 0:seconds(1/Fs):seconds(info.Duration);
t = t(1:end-1);
%   Plot the audio data as a function of time.
figure;
plot(t,y)
xlabel('Time')
ylabel('Audio Signal')
title(' Audio file in Time domain ')
grid;
%   Plot the audio file in frequency domain
Y = fftshift(fft(y));
Ns = info.TotalSamples;
Fvec = linspace(-Fs/2,Fs/2,Ns) ;
Ymag = abs(Y); Yphase = angle(Y);
figure;
plot(Fvec,Ymag)
xlabel('Frequency')
ylabel('Transformed Audio Signal')
title(' Magnitude Spectrum ')
grid;

figure;
plot(Fvec,Yphase)
xlabel('Frequency')
ylabel('Transformed Audio Signal')
title(' Phase Spectrum ')
grid;
%   Play the audio file
sound(y,Fs);

%%  Our Channel is (Decaying Exponential) 

%   Create Channel Two
exponential_2 = exp((-2).*(pi).*(5000).*(t));
%   Perform Convolution between the input Audio file and the impulse
%   response of the channel to get the output of the channel
y = ((1)./(Fs)).*(conv(exponential_2,y));

%   Plot the audio data as a function of time.
t = 0:(1/Fs):((length(y).*(1/Fs)));
t = t(1:end-1);
figure;
plot(t,y)
xlabel('Time')
ylabel('Output Audio Signal')
title(' Channel two''s Output ')
grid;
%   Plot the audio file in frequency domain
Y = fftshift(fft(y));
Ns = length(y);
%Ns_2 = info.TotalSamples;
Fvec = linspace(-(Fs)/2,(Fs)/2,(Ns));
Ymag = abs(Y); Yphase = angle(Y);
figure;
plot(Fvec,Ymag)
xlabel('Frequency')
ylabel('Transformed Audio Signal')
title(' Magnitude Spectrum ')
grid;

figure;
plot(Fvec,Yphase)
xlabel('Frequency')
ylabel('Transformed Audio Signal')
title(' Phase Spectrum ')
grid;
%   Play the audio file
x = y;
sound(x,Fs);

%% Amplifier (additional section)

%   Apply Amplitude scaling to the channel output to get noticable sound
A_2 = 20000;
x = (A_2) .* (x);

%   Plot the audio data as a function of time.
figure;
plot(t,x)
xlabel('Time')
ylabel('Amplified Signal')
title(' Amplified Output Signal ')
grid;
%   Plot the audio file in frequency domain
X = fftshift(fft(x));
Xmag = abs(X); Xphase = angle(X);
figure;
plot(Fvec,Xmag)
xlabel('Frequency')
ylabel('Amplified Signal in Frequency Domain')
title(' Amplified Output Signal''s Magnitude Spectrum ')
grid;

figure;
plot(Fvec,Xphase)
xlabel('Frequency')
ylabel('Transformed Audio Signal')
title(' Amplified Output Signal''s Phase Spectrum ')
grid;

%   Play the audio file
sound(x,Fs);

%%  Noise 
%   Where x is a vector represents the output of the channel

%The user should enter the value of the sigma at this stage
msg2 = 'Hello user, Please enter the Value of sigma (The Standard Deviation) : ';  
sigma = input(msg2);
%   The output will be a Gaussian distributed noise with zero mean and standard deviation of sigma
%   Z =sigma*randn(1,length(x));
Z =sigma*randn(length(x),1);
%   Gaussian noise is additive noise 
x = x + Z;

%   Plot the audio data as a function of time.
figure;
plot(t,x)
xlabel('Time')
ylabel('Noisy Signal')
title(' Output Noisy Signal ')
grid;
%   Plot the audio file in frequency domain
X = fftshift(fft(x));
Xmag = abs(X); Xphase = angle(X);
figure;
plot(Fvec,Xmag)
xlabel('Frequency')
ylabel('Noisy Signal in Frequency Domain')
title(' Output Noisy Signal''s Magnitude Spectrum ')
grid;

figure;
plot(Fvec,Xphase)
xlabel('Frequency')
ylabel('Noisy Signal in Frequency Domain')
title(' Output Noisy Signal''s Phase Spectrum ')
grid;
%   Play the audio file
sound(x,Fs);

%%  Receiver   

%   Filtering
X = fftshift(fft(x));
% Filter the Noisy signal 
X([1:(int64(((abs(((Fs)/2)-(3400)))/(Fs)).*(Ns)))]) = 0;
X([(end-(int64(((abs(((Fs)/2)-(3400)))/(Fs)).*(Ns)))):end]) = 0;
% Get the Filtered Signal in Time Domain 
x = real(ifft(ifftshift(X)));
%   Plot the audio data as a function of time.
figure;
plot(t,x)
xlabel('Time')
ylabel('Filtered Signal')
title(' Lowpass Filter Output Signal ')
grid;
%   Plot the audio file in frequency domain
Xmag = abs(X); Xphase = angle(X);
figure;
plot(Fvec,Xmag)
xlabel('Frequency')
ylabel('Filtered Signal in Frequency Domain')
title(' Lowpass Filter Output Signal''s Magnitude Spectrum ')
grid;

figure;
plot(Fvec,Xphase)
xlabel('Frequency')
ylabel('Filtered Signal in Frequency Domain')
title(' Lowpass Filter Output Signal''s Phase Spectrum ')
grid;
%   Play the audio file
sound(x,Fs);
