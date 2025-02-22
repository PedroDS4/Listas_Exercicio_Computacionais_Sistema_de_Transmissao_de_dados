% Parâmetros
fs = 44100;         % Frequência de amostragem (10 kHz)
M = 1;              % Tamanho da janela temporal

% Parâmetros da mensagem
B = 200;            % Largura de banda desejada para a mensagem (2000 Hz)
Tb = 0.5;          % Deslocamento temporal da segunda mensagem

f1 = 10000;
f2 = f1+1000;

% Largura da janela (inversamente proporcional a B)
L = 1 / (2 * B);    % Período de nulidade da mensagem

% Tempo de -50 ms a 50 ms
t = -M:1/fs:M;

% Mensagens
A1 = 2;
A2 = 2;
msg1 = A1 * sin(2 * pi * B * t) ./ (pi * t);
msg1(t == 0) = 2 * A1 * B; % Corrigir o ponto onde t == 0 para evitar NaN

msg2 = A2 * sin(2 * pi * B * (t - Tb)) ./ (pi * (t - Tb));
msg2(t == Tb) = 2 * A2 * B; % Corrigir o ponto onde t == Tb para evitar NaN

% Janela de Hamming
N1 = round(L * fs); % Número de amostras na janela 1
hamming1 = 0.54 - 0.46 * cos(2 * pi * (0:N1-1) / (N1-1)); % Janela de Hamming 1

N2 = round(L * fs); % Número de amostras na janela 2
hamming2 = 0.54 - 0.46 * cos(2 * pi * (0:N2-1) / (N2-1)); % Janela de Hamming 2

% Criar janelas para cada mensagem
window1 = zeros(size(t)); % Inicializar janela 1
center1 = find(t >= 0, 1); % Índice central para msg1
start1 = center1 - floor(N1 / 2);
window1(start1:start1 + N1 - 1) = hamming1;

window2 = zeros(size(t)); % Inicializar janela 2
center2 = find(t >= Tb, 1); % Índice central para msg2
start2 = center2 - floor(N2 / 2);
window2(start2:start2 + N2 - 1) = hamming2;

% Aplicar janelas às mensagens
msg1_windowed = msg1 .* window1;
msg2_windowed = msg2 .* window2;

% Modulação (AM-DSB)
carrier1 = cos(2 * pi * f1 * t);  % Primeira portadora
carrier2 = cos(2 * pi * f2 * t);  % Segunda portadora

modulated1 = msg1_windowed .* carrier1;  % Sinal modulado 1
modulated2 = msg2_windowed .* carrier2;  % Sinal modulado 2

% Soma dos sinais modulados
r_msg = modulated1 + modulated2;

% Transformada de Fourier
N = length(t);
f = (-N/2:N/2-1) * (fs / N); % Frequências

spectrum = abs(fftshift(fft(r_msg))); % Espectro de magnitude

% Plot da função no tempo
figure;
subplot(2, 1, 1);
plot(t, r_msg);
title('Mensagem sobreposta no tempo (com janela de Hamming)');
xlabel('Tempo (s)');
ylabel('Amplitude');
grid on;

% Plot do espectro de magnitude
subplot(2, 1, 2);
plot(f, spectrum);
title('Espectro de Magnitude da Mensagem Enviada');
xlabel('Frequência (Hz)');
ylabel('|X(f)|');
grid on;

