%%  The effect of each Channel
clear all;
close all;
clc;

%%  First Channel (Delta Function)
%   read the audio file
[y_1,Fs_1] = audioread('gs-16b-1c-44100hz.wav');
%   Plot your output sound file in time domain and the frequency domain
info = audioinfo('gs-16b-1c-44100hz.wav');
%   Create a vector t the same length as y, that represents elapsed time.
t_1 = 0:(1/Fs_1):(info.Duration);
%t = 0:seconds(1/Fs):seconds(info.Duration);
t_1 = t_1(1:end-1);
%   Create Channel one
Delta_1 = [1];
%   Perform Convolution between the input Audio file and the impulse
%   response of the channel to get the output of the channel
y_1 = conv(Delta_1,y_1);
%   Plot the audio data as a function of time.
figure;
plot(t_1,y_1)
xlabel('Time')
ylabel('Output Audio Signal')
title(' Channel one''s Output ')
grid;
%   Plot the audio file in frequency domain
Y_1 = fftshift(fft(y_1));
fs_1 = info.SampleRate;
Ns_1 = info.TotalSamples;
Fvec_1 = linspace(-(fs_1)/2,(fs_1)/2,(Ns_1));
%Fvec_1 = linspace(min(min(Y_1)),max(max(Y_1)),length(Y_1));
Ymag_1 = abs(Y_1);
figure;
plot(Fvec_1,Ymag_1)
xlabel('Frequency')
ylabel('Transformed Audio Signal')
title(' Channel one''s Magnitude Spectrum ')
grid;
%   Play the audio file
sound(y_1,Fs_1);
%%  Second Channel
%   read the audio file
[y_2,Fs_2] = audioread('gs-16b-1c-44100hz.wav');
%   Plot your output sound file in time domain and the frequency domain
info = audioinfo('gs-16b-1c-44100hz.wav');
%   Create a vector t the same length as y, that represents elapsed time.
t_2 = 0:(1/Fs_2):(info.Duration);
%t = 0:seconds(1/Fs):seconds(info.Duration);
t_2 = t_2(1:end-1);
%   Create Channel Two
exponential_2 = exp((-2).*(pi).*(5000).*(t_2));
%   Perform Convolution between the input Audio file and the impulse
%   response of the channel to get the output of the channel
y_2 = ((1)./(5000)).*(conv(exponential_2,y_2));
%   Plot the audio data as a function of time.
t_22 = 0:(1/Fs_2):((length(y_2).*(1/Fs_2)));
t_22 = t_22(1:end-1);
figure;
plot(t_22,y_2)
xlabel('Time')
ylabel('Output Audio Signal')
title(' Channel two''s Output ')
grid;
%   Plot the audio file in frequency domain
Y_2 = fftshift(fft(y_2));
fs_2 = info.SampleRate;
Ns_2 = length(y_2);
%Ns_2 = info.TotalSamples;
Fvec_2 = linspace(-(fs_2)/2,(fs_2)/2,(Ns_2));
%Fvec_2 = linspace(min(min(Y_2)),max(max(Y_2)),length(Y_2));
Ymag_2 = abs(Y_2);
figure;
plot(Fvec_2,Ymag_2)
xlabel('Frequency')
ylabel('Transformed Audio Signal')
title(' Channel two''s Magnitude Spectrum ')
grid;
%   Play the audio file
sound(y_2,Fs_2);
%%  Third Channel
%   read the audio file
[y_3,Fs_3] = audioread('gs-16b-1c-44100hz.wav');
%   Plot your output sound file in time domain and the frequency domain
info = audioinfo('gs-16b-1c-44100hz.wav');
%   Create a vector t the same length as y, that represents elapsed time.
t_3 = 0:(1/Fs_3):(info.Duration);
%t = 0:seconds(1/Fs):seconds(info.Duration);
t_3 = t_3(1:end-1);
%   Create Channel Three
exponential_3 = exp((-2).*(pi).*1000.*(t_3));
%   Perform Convolution between the input Audio file and the impulse
%   response of the channel to get the output of the channel
y_3 = ((1)./(Fs_3)).*(conv(exponential_3,y_3));
%   Plot the audio data as a function of time.
t_33 = 0:(1/Fs_3):((length(y_3).*(1/Fs_3)));
t_33 = t_33(1:end-1);
figure;
plot(t_33,y_3)
xlabel('Time')
ylabel('Output Audio Signal')
title(' Channel three''s Output ')
grid;
%   Plot the audio file in frequency domain
Y_3 = fftshift(fft(y_3));
fs_3 = info.SampleRate;
Ns_3 = length(y_3);
%Ns_2 = info.TotalSamples;
Fvec_3 = linspace(-(fs_3)/2,(fs_3)/2,(Ns_3));
%Fvec_2 = linspace(min(min(Y_2)),max(max(Y_2)),length(Y_2));
Ymag_3 = abs(Y_3);
figure;
plot(Fvec_3,Ymag_3)
xlabel('Frequency')
ylabel('Transformed Audio Signal')
title(' Channel three''s Magnitude Spectrum ')
grid;
%   Play the audio file
sound(y_3,Fs_3);
%%  Fourth Channel
%   read the audio file
[y_4,Fs_4] = audioread('gs-16b-1c-44100hz.wav');
%   Plot your output sound file in time domain and the frequency domain
info = audioinfo('gs-16b-1c-44100hz.wav');
%   Create a vector t the same length as y, that represents elapsed time.
t_4 = 0:(1/Fs_4):(info.Duration);
%t = 0:seconds(1/Fs):seconds(info.Duration);
t_4 = t_4(1:end-1);
%   Create Channel Four
fun_4 = [2,zeros(1,((info.SampleRate))-2),0.5];     %   to get the length of one second 
%   Perform Convolution between the input Audio file and the impulse
%   response of the channel to get the output of the channel
y_4 = conv(fun_4,y_4);
%   Plot the audio data as a function of time.
t_44 = 0:(1/Fs_4):((length(y_4).*(1/Fs_4)));
t_44 = t_44(1:end-1);
figure;
plot(t_44,y_4)
xlabel('Time')
ylabel('Output Audio Signal')
title(' Channel four''s Output ')
grid;
%   Plot the audio file in frequency domain
Y_4 = fftshift(fft(y_4));
fs_4 = info.SampleRate;
Ns_4 = length(y_4);
%Ns_2 = info.TotalSamples;
Fvec_4 = linspace(-(fs_4)/2,(fs_4)/2,(Ns_4));
%Fvec_2 = linspace(min(min(Y_2)),max(max(Y_2)),length(Y_2));
Ymag_4 = abs(Y_4);
figure;
plot(Fvec_4,Ymag_4)
xlabel('Frequency')
ylabel('Transformed Audio Signal')
title(' Channel four''s Magnitude Spectrum ')
grid;
%   Play the audio file
sound(y_4,Fs_4);