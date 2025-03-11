%Lab1_1_1
n=0:3;
x=[2,-1,1,1];
w=-pi:0.01:pi;
DTFT_X=x*exp(-j*n'*w);
figure(1);    %第一张图
subplot(211);
plot(w,abs(DTFT_X));
xlabel('\Omega/\pi');
title('Magnitude');
axis tight;    %自动调整坐标轴
subplot(212);
plot(w,angle(DTFT_X)/pi);
xlabel('\Omega/\pi');
title('Phase');
axis tight;
%% %Lab1_1_2
x=[2,-1,1,1];
DFT_X=fftshift(fft(x));    %fftshift频谱搬移
subplot(211);    %继续绘图
hold on;
stem(2*pi/4*[-2:1],abs(DFT_X),'filled'); 
subplot(212);
hold on;
stem(2*pi/4*[-2:1],angle(DFT_X)/pi,'filled');
%% %Lab1_1_3
x=[2 -1 1 1 zeros(1,60)];
n1=0:63;
n=n1-length(n1)/2;
DTFT_X_64=fftshift(fft(x));
figure(2);    %第二张图
subplot(211);
stem(n,abs(DTFT_X_64),'filled');
xlabel('\Omega/\pi');
title('Magnitude');
axis tight;    %自动调整坐标轴
subplot(212);
stem(n,angle(DTFT_X_64)/pi,'filled');
xlabel('\Omega/\pi');
title('Phase');
%% %Lab1_2_1
n=0:10;
x=cos(0.48*pi*n)+cos(0.52*pi*n);
DFT_X=fft(x);
figure(1);    %未补零10点DFT
subplot(211);
stem(n,abs(DFT_X),'filled');
xlabel('\Omega');
title('Magnitude');
subplot(212);
stem(n,angle(DFT_X)/pi,'filled');
xlabel('\Omega');
title('Phase');
figure(2);    %补零100点DFT
n1=0:100;
x1=[x,zeros(1,90)];
DFT_X1=fft(x1);
subplot(211);
hold on;
stem(n1,abs(DFT_X1),'filled');
xlabel('\Omega');
title('Magnitude');
axis tight;
subplot(212);
hold on;
stem(n1,angle(DFT_X1)/pi,'filled');
xlabel('\Omega');
title('Phase');
axis tight;
%% %Lab1_2_2
n=0:100;
x=cos(0.48*pi*n)+cos(0.52*pi*n);
DFT_X=fft(x);
subplot(211);
hold on;
stem(n,abs(DFT_X),'filled');
xlabel('\Omega');
title('Magnitude');
subplot(212);
hold on;
xlabel('\Omega');
title('Phase');
stem(n,angle(DFT_X)/pi,'filled');
%% %Lab1_3
n=0:199;    %采样率10Hz，采样时长20s
t=n*20/length(n);
x=0.15*sin(2*pi*t)+sin(2*pi*2*t)-0.1*sin(2*pi*3*t);
DFT_X=fft(x);
subplot(211);
stem(n/20,20/length(n)*abs(DFT_X),'filled');
xlabel('\Omega/Hz');
title('Magnitude');
subplot(212);
hold on;
xlabel('\Omega/Hz');
title('Phase');
stem(n/20,angle(DFT_X)/pi,'filled');
%% %Lab1_4
t=input("采样间隔(s)：");
T=input("截取时长(s)：");
n=0:t:T;
x=exp(-0.1*n*T/100).*heaviside(n*T/100);
DFT_X=fftshift(fft(x));
n=n-T/2;
subplot(211);
stem(n/(T*t),abs(DFT_X),'filled');
xlabel('\Omega/Hz');
title('Magnitude');
subplot(212);
xlabel('\Omega/Hz');
title('Phase');
stem(n/(T*t),angle(DFT_X)/pi,'filled');
