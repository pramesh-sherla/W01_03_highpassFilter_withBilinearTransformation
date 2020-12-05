%% set sampling time and Run time
tStop = 0.02; % for simulink model
fTime = 500;    
dt = 1/fTime;    % for simulink model

%% Frequency Response

G_s = tf([1 0],[1 7265]);                % Transfer Function in s-domain
Fs = 5000;
sampleTime = 1/Fs;                       % Sample time for quantization
H_z = c2d(G_s,sampleTime,'tustin');      % Bilinear Transform

figure(1);
bode(G_s,H_z);                           % Frequency Response
legend('Tranfer Function in s - Domain {G(s)}','Tranfer Function in s - Domain {H[z]}');

figure(2);
step(G_s,H_z);                           % Step Response
legend('Tranfer Function in s - Domain {G(s)}','Tranfer Function in z - Domain {H[z]}');

