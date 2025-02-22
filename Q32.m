pkg load signal

% Frequência de amostragem
Fs = 44100;
%Fs = 10000

%Frequências de corte
fc = 3000;

%Frequencias em Hz do projeto do filtro
Fn = Fs/2;
delta_f = 100;
fs1 = (fc + delta_f/2);
fp1 = (fs1 - delta_f);

%Normalização das frequências do projeto para a função firpm
fs1_n = fs1/Fn;
fp1_n = fp1/Fn;

f = [0 fp1_n fs1_n 1];
a = [1 1 0 0];
M = 400;
h = firpm (M, f, a);

[H,f] = freqz(h);
f = f*Fn/(pi);
modH = abs(H);
FaseH = unwrap(angle(H));

% Vetor de tempo
N = 1;
t = -N:1/Fs:N;

% Transformada de Fourier
K = length(H);
f = (-K/2:K/2-1) * (Fs / K); % Frequências

%Sinais de teste
f1 = 800;
f2 = 2000;
f3 = 4500;

x1 = cos(2*pi*f1*t);
x2 = cos(2*pi*f2*t);
x3 = cos(2*pi*f3*t);

x = x1+0.5*x2+2*x3;


s = conv(x,h,'full');

S = fftshift(fft(s,length(H)));
mod_S = abs(S);

%Plotagem dos Espectros
figure;
subplot(1,1,1);
plot(f,mod_S,'-blue')
xlabel('Frequência(Hz)');
ylabel('Magnitude');
title('|S_filtrado(f)|');
grid on;
