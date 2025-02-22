% Parâmetros
fs = 44100;         % Frequência de amostragem (10 kHz)
M = 1;              % Tamanho da janela temporal

% Parâmetros da mensagem
B = 2000;            % Largura de banda desejada para a mensagem(200 Hz)
Tb = 0;

% Parâmetros da modulação
f1 = 10000;
f2 = f1 + 1000;

% Tempo de -50 ms a 50 ms
t = -M:1/fs:M;

% Mensagens
A1 = 2;
A2 = 2;
msg1 = A1*sin(2*pi * B * t) ./ (pi * t);
msg1(t == 0) = 2*A1*B; % Corrigir o ponto onde t == 0 para evitar NaN


msg2 = A2*sin(2*pi * B * (t-Tb)) ./ (pi * (t-Tb));
msg2(t == Tb) = 2*A2*B; % Corrigir o ponto onde t == Tb para evitar NaN


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
plot(t, r_msg,'r');
title('Mensagem sobrepostas no tempo');
xlabel('Tempo (s)');
ylabel('Amplitude');
grid on;

% Plot do espectro de magnitude
subplot(2, 1, 2);
plot(f, spectrum,'black');
title('Espectro de Magnitude da Mensagem Enviada');
xlabel('Frequência (Hz)');
ylabel('|X(f)|');
grid on;

