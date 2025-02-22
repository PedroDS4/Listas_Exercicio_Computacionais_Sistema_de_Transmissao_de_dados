pkg load signal
% Parâmetros
fs = 44100;         % Frequência de amostragem (10 kHz)
Ts = 1/fs;
t_max = 2;              % Tamanho da janela temporal

% Parâmetros da mensagem
B = 800;            % Largura de banda desejada para a mensagem(200 Hz)
Tb = 0.1;

% Tempo de -50 ms a 50 ms
t = -t_max:Ts:t_max;

% Mensagens
A1 = 2;
A2 = 2;
m1 = A1*sin(2*pi * B * t) ./ (pi * t);
m1(t == 0) = 2*A1*B; % Corrigir o ponto onde t == 0 para evitar NaN


m2 = A2*sin(2*pi * B * (t-Tb)) ./ (pi * (t-Tb));
m2(t == Tb) = 2*A2*B; % Corrigir o ponto onde t == 0 para evitar NaN


% Transmissor

% Seno e cosseno demoduladores
fc = 10000;
c = cos(2*pi*fc*t);
s = sin(2*pi*fc*t);

v1 = m1.*c;
v2 = m2.*s;

v = v1 + v2;



% Demodulador

gamma = 0;
phi = pi;
f0 = fc;
c_d = cos(2*pi*(f0+gamma)*t+phi);
s_d = sin(2*pi*(f0+gamma)*t+phi);

x1 = v.*c_d;
x2= v.*s_d;


% Filtro passa-baixas
% Frequências do projeto
Fn = fs/2;
deltaf_2 = 300;
fp = (B + deltaf_2);
fs = (fp + deltaf_2);

%Normalização das frequências do projeto para a função firpm
fs_n = fs/Fn;
fp_n = fp/Fn;

fbe = [0 fp_n fs_n 1];
damps = [1 1 0 0];
M = 400;

b = firpm(M,fbe,damps);                   % impulse response of LPF


%Sinal m demodulado
s1 = 2*filter(b,1,x1);                          % LPF the demodulated signal
s2 = 2*filter(b,1,x2);


% Transformada deFourier
N = length(t);
f = (-N/2:N/2-1) * (fs / N); % Frequências
spectrum_s1 = abs(fftshift(fft(m1)));
spectrum_s2 = abs(fftshift(fft(s1))); % Espectro de magnitude

% Plot do espectro de magnitude
figure;
subplot(2, 1, 1);
plot(f, spectrum_s1,'red');
title('Espectro de Magnitude da Mensagem Enviada');
xlabel('Frequência (Hz)');
ylabel('|W(f)|');
grid on;

subplot(2,1,2);
plot(f, spectrum_s2,'k');
title('Espectro de Magnitude da Mensagem Modulada por Lei Quadrática');
xlabel('Frequência (Hz)');
ylabel('|X(f)|');
grid on;


