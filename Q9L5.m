pkg load signal

% AM.m suppressed carrier AM with freq and phase offset
time=.3; Ts=1/10000;                        % sampling interval and time base
t=Ts:Ts:time; lent=length(t);               % define a "time" vector
fc=1000; c=cos(2*pi*fc*t);                  % define the carrier at freq fc
fm=20; %w=5/lent*(1:lent)+
w = cos(2*pi*fm*t);    % create "message"
v=c.*w;


% modulate with carrier
gamma = [0.01, 0.1, 1, 10];                   % freq
phi=[-pi,-pi/2,-pi/3,-pi/6,0,pi/6,pi/3,pi/2,pi]; %phase offset

fs = 1/Ts;
N = length(t);
f = (-N/2:N/2-1) * (fs / N); % Frequências


% generate the figure
for i = 1:length(gamma)

  c_i =cos(2*pi*(fc+gamma(i))*t);              % create cosine for demod
  x=v.*c_i;                                    % demod received signal

  fbe=[0 0.1 0.2 1]; damps=[1 1 0 0]; fl=100; % low pass filter design
  b=firpm(fl,fbe,damps);                   % impulse response of LPF
  m=2*filter(b,1,x);

  figure(i);
  M = fftshift(fft(m));
  abs_M = abs(M);
  plot(f,abs_M,"black");
  title(sprintf('Espectro de Magnitude da Mensagem Enviada com erro de frequência gamma = %d ',gamma(i)));
  xlabel('Frequência (Hz)');
  ylabel('|Env(f)|');
  grid on;

endfor
