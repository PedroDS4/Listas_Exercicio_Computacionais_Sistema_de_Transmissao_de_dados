pkg load signal

% Frequência de amostragem
Fs = 44100;
%Fs = 20000;

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
M = 200;
h = firpm (M, f, a);

[H,f] = freqz(h);
f = f*Fn/(pi);
modH = abs(H);
FaseH = unwrap(angle(H));

%Filtro
figure;
plot(h,'-black')
xlabel('n');
ylabel('h[n]');
title('Filtro em tempo discreto');
grid on;

%Plotagem dos Espectros
figure;
subplot(2,1,1);
plot(f,modH,'-blue')
xlabel('Frequência(Hz)');
ylabel('Magnitude');
title('|H(f)|');
grid on;

subplot(2,1,2);
plot(f,FaseH,'-m')
xlabel('Frequência(Hz)');
ylabel('Fase (radianos)');
title('<H(f)');
grid on;
