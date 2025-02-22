%pkg load signal


% AM.m suppressed carrier AM with freq and phase offset
time=.3; Ts=1/44100;                        % sampling interval and time base
Fs = 1/Ts;
t=Ts:Ts:time; lent=length(t);               % define a "time" vector
fc=1000; c=cos(2*pi*fc*t);                  % define the carrier at freq fc
fm=20;% w=5/lent*(1:lent)+cos(2*pi*fm*t);    % create "message"
w= cos(2*pi*fm*t);    % create "message"
v=c.*w;


% modulate with carrier
gamma = [0, 0.01, 0.1, 1, 10];                   % freq
phi=[-pi,-pi/2,-pi/3,-pi/6,0,pi/6,pi/3,pi/2,pi]; %phase offset

fs = 1/Ts;
N = length(t);
f = (-N/2:N/2-1) * (fs / N); % Frequências


% generate the figure
for i = 1:length(phi)

  c_i=cos(2*pi*fc*t+phi(i));              % create cosine for demod
  x=v.*c_i;                                    % demod received signal

  
  B = fm;
  Fn = Fs/2;
  delta_f = 100;
  fs = (B + delta_f);
  fp = (fs - delta_f/2);
  
  fp_n = fp/Fn;
  fs_n = fs/Fn;
  
  fbe=[0 fp_n fs_n 1]; damps=[1 1 0 0]; M = 4000; % low pass filter design
  b=firpm(M,fbe,damps);                   % impulse response of LPF
  m=2*filter(b,1,x);

  figure(i);
  M = fftshift(fft(m));
  abs_M = abs(M);
  plot(f,abs_M,'b');
  title(sprintf('Espectro de Magnitude da Mensagem Enviada com distorção de fase phi = %d ',phi(i)));
  xlabel('Frequência (Hz)');
  ylabel('|Env(f)|');
  grid on;
end
