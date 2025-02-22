pkg load signal

% Parâmetros
Ts = 1/44100;       % Período de amostragem
Fs = 1/Ts;          % Frequência de amostragem (10 kHz)
t_fim = 2;              % Tamanho da janela temporal

% Parâmetros da mensagem
B = 100;            % Largura de banda desejada para o sinal

% Parâmetros da modulação
f0 = 1000;
A0 = 1;

% Tempo de -50 ms a 50 ms
t = -t_fim:Ts:t_fim;

% Mensagens
A1 = 2;
w = A1*sin(2*pi * B * t) ./ (pi * t);
w(t == 0) = 2*A1*B; % Corrigir o ponto onde t == 0 para evitar NaN

c = A0*cos(2*pi*f0*t);

x = w + c;

% Lei quadrática
y = x.^2;

%Filtro passa-faixa

%Frequencias em Hz do projeto do filtro

Fn = Fs/2;

delta_f = 200;

fp1 = (f0 - B - delta_f);
fs1 = (fp1 - delta_f);
fp2 = (f0 + B + delta_f);
fs2 = (fp2 + delta_f);


%Normalização das frequências do projeto para a função firpm
fs1_n = fs1/Fn;
fp1_n = fp1/Fn;
fs2_n = fs2/Fn;
fp2_n = fp2/Fn;


f = [0 fs1_n fp1_n fp2_n fs2_n 1];
a = [0 0 1 1 0 0];

M = 800;
h = firpm (M, f, a);
%Sinal final modulado sem multiplicador
x = filter(h,1,y);


% Processo de demodulação
fc2 = f0;
c2=cos(2*pi*(fc2)*t);              % create cosine for demod

v =x.*c2;                          % demod received signal

%Frequencias em Hz do projeto do filtro
Fn2 = Fs/2;
deltaf_2 = 200;
fp = (B + deltaf_2);
fs = (fp + deltaf_2);

%Normalização das frequências do projeto para a função firpm
fs_n = fs/Fn;
fp_n = fp/Fn;

fbe = [0 fp_n fs_n 1];
damps = [1 1 0 0];

b = firpm(M,fbe,damps);                   % impulse response of LPF

%Sinal m demodulado
m=2*filter(b,1,v);                          % LPF the demodulated signal


% Transformada de Fourier
N = length(t);
f = (-N/2:N/2-1) * (Fs / N); % Frequências
spectrum_w = abs(fftshift(fft(w)));
spectrum_mod = abs(fftshift(fft(m))); % Espectro de magnitude

% Plot do espectro de magnitude
figure;
subplot(2, 1, 1);
plot(f, spectrum_w,'red');
title('Espectro de Magnitude da Mensagem Enviada');
xlabel('Frequência (Hz)');
ylabel('|W(f)|');
grid on;

subplot(2,1,2);
plot(f, spectrum_mod,'k');
title('Espectro de Magnitude da Mensagem Demodulada');
xlabel('Frequência (Hz)');
ylabel('|M(f)|');
grid on;
