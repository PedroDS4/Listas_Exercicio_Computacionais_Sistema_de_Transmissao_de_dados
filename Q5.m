pkg load signal

% Frequência de amostragem
Fs = 44100

% Vetor de tempo
N = 1;
t = -N:1/Fs:N;


%Frequências de corte
fc1 = 2000;
fc2 = 2300;

#Frequencias em Hz do projeto do filtro
Fn = Fs/2;
delta_f = 100
fs1 = (fc1 + delta_f/2);
fp1 = (fs1 - delta_f);
fs2 = (fc2 - delta_f/2);
fp2 = (fs2 + delta_f);


#Normalização das frequências do projeto para a função firpm
fs1_n = fs1/Fn;
fp1_n = fp1/Fn;
fs2_n = fs2/Fn;
fp2_n = fp2/Fn;


f = [0 fp1_n fs1_n fs2_n fp2_n 1];
a = [0 0 1 1 0 0];

M = 600;
h = firpm (M, f, a);

[H,f] = freqz(h);
f = f*Fn/(pi);

std = 1;
mu = 0;
noise = std*(2*rand(size(t))-1) + mu;

x = conv(noise,h,"same");

% Transformada de Fourier
K = length(x);
f = (-K/2:K/2-1) * (Fs / K); % Frequências

%Sinais de teste
f1 = 1000;
c1 = cos(2*pi*f1*t);


y = x%.*c1;

Y = fftshift(fft(y));
mod_Y = abs(Y);

%Plotagem dos Espectros
figure;
subplot(1,1,1);
plot(f,mod_Y,'-blue')
xlabel('Frequência(Hz)');
ylabel('Magnitude');
title('|H(f)|');
grid on;
