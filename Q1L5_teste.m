% Parâmetros
fs = 20000;         % Frequência de amostragem (10 kHz)
M = 2;              % Tamanho da janela temporal

% Parâmetros da mensagem
B = 2000;            % Largura de banda desejada para a mensagem(200 Hz)
Tb = 0.1;

% Parâmetros da modulação
f1 = 2000;
f2 = f1 + 5000;

% Tempo de -50 ms a 50 ms
t = -M:1/fs:M;

% Mensagens
A1 = 2;
A2 = 2;
msg1 = A1*sin(2*pi * B * t) ./ (pi * t);
msg1(t == 0) = 2*A1*B; % Corrigir o ponto onde t == 0 para evitar NaN


msg2 = A2*sin(2*pi * B * (t-Tb)) ./ (pi * (t-Tb));
msg2(t == Tb) = 2*A2*B; % Corrigir o ponto onde t == 0 para evitar NaN

L = 1/(2*B);  % Largura de cada janela (ajustável)
window1 = (t >= -L/2 & t <= L/2);          % Janela retangular para msg1
window2 = (t >= (Tb - L/2) & t <= (Tb + L/2)); % Janela retangular centrada em Tb para msg2

msg1 = msg1 .* window1; % Multiplica msg1 pela janela 1
msg2 = msg2 .* window2; % Multiplica msg2 pela janela 2

% Modulação (AM-DSB)
carrier1 = cos(2*pi*f1*t);  % Primeira portadora
carrier2 = cos(2*pi*f2*t);  % Segunda portadora

modulated1 = msg1 .* carrier1;  % Sinal modulado 1
modulated2 = msg2 .* carrier2;  % Sinal modulado 2


% Transformada de Fourier
N = length(t);
f = (-N/2:N/2-1) * (fs / N); % Frequências

r_msg = modulated1 + modulated2;

spectrum = abs(fftshift(fft(r_msg))); % Espectro de magnitude


% Plot da função no tempo
figure;
subplot(2, 1, 1);
plot(t, r_msg,'cyan');
title('Mensagem sobrepostas no tempo');
xlabel('Tempo (s)');
ylabel('Amplitude');
grid on;

% Plot do espectro de magnitude
subplot(2, 1, 2);
plot(f, spectrum,'blue');
title('Espectro de Magnitude da Mensagem Enviada');
xlabel('Frequência (Hz)');
ylabel('|X(f)|');
grid on;

