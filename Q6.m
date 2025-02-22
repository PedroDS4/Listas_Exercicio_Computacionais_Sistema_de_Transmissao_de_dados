pkg load signal


% AMlarge.m: large carrier AM demodulated with "envelope"
time=.08; Ts=1/10000;                          % sampling interval and time
t=0:Ts:time; lent=length(t);                   % define a "time" vector


fi = pi/3;
g = 10000000;

fc=1000; c=cos(2*pi*(fc+g)*t+fi);                     % define carrier at freq fc
fm=20; w=cos(2*pi*fm*t);                     % create "message" > -1

v=c.*w+c;

                                               % modulate with large carrier
fbe=[0 0.1 0.2 1]; damps=[1 1 0 0]; fl=100;    % low pass filter design
b=firpm(fl,fbe,damps);                         % impulse response of LPF


envv=(pi/2)*filter(b,1,abs(v));                % find envelope


fs = 1/Ts;
N = length(t);
f = (-N/2:N/2-1) * (fs / N); % Frequências

E = fftshift(fft(envv));
abs_E = abs(E);

% generate the figure
figure(1)
plot(f,abs_E,"black");
title('Espectro de Magnitude da Mensagem Enviada');
xlabel('Frequência (Hz)');
ylabel('|Env(f)|');
grid on;


% this shows things a bit more clearly (but won't print well)
figure(2)
plot(t,v,	"red")
 hold on
 plot(t,w)
 plot(t,envv,'k')
 ylabel('amplitude')
 xlabel('orange=modulated signal, blue=message, black=envelope')
hold off

