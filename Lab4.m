%Lab4_1_1
%滤波器长度N
wp = 0.2*pi;wst = 0.3*pi;
tr_width = wst-wp;
N = ceil(1.8*pi/tr_width)+1;
%单位脉冲响应
n = 0:(N-1);wc = (wp+wst)/2;
alpha = (N-1)/2;
hd = (wc/pi)*sinc((wc/pi)*(n-alpha));
%加窗
w_boxcar = boxcar(N)';
h = hd.*w_boxcar;
%绘图
subplot(221);stem(n,hd,'filled');
axis tight;xlabel('n');ylabel('hd(n)');
[Hr,w1] = zerophase(h);
subplot(222);plot(w1/pi,Hr);
axis tight;xlabel('\omega/\pi');ylabel('H(\omega)');
subplot(223);stem(n,h,'filled');
axis tight;xlabel('n');ylabel('h(n)');
[H,w] = freqz(h,1);
subplot(224);plot(w/pi,20*log10(abs(H)/max(abs(H))));
xlabel('\omega/\pi');ylabel('dB');
grid on 
%% Lab4_1_2
%滤波器长度N
wp = 0.2*pi;wst = 0.3*pi;
tr_width = wst-wp;
N = ceil(6.2*pi/tr_width)+1;
%单位脉冲响应
n = 0:(N-1);wc = (wp+wst)/2;
alpha = (N-1)/2;
hd = (wc/pi)*sinc((wc/pi)*(n-alpha));
%加窗
w_hanning = hanning(N)';
h = hd.*w_hanning;
%绘图
subplot(221);stem(n,hd,'filled');
axis tight;xlabel('n');ylabel('hd(n)');
[Hr,w1] = zerophase(h);
subplot(222);plot(w1/pi,Hr);
axis tight;xlabel('\omega/\pi');ylabel('H(\omega)');
subplot(223);stem(n,h,'filled');
axis tight;xlabel('n');ylabel('h(n)');
[H,w] = freqz(h,1);
subplot(224);plot(w/pi,20*log10(abs(H)/max(abs(H))));
xlabel('\omega/\pi');ylabel('dB');
grid on 
%% %Lab4_1_3
%滤波器长度N
wp = 0.2*pi;wst = 0.3*pi;
tr_width = wst-wp;
N = ceil(6.6*pi/tr_width)+1;
%单位脉冲响应
n = 0:(N-1);wc = (wp+wst)/2;
alpha = (N-1)/2;
hd = (wc/pi)*sinc((wc/pi)*(n-alpha));
%加窗
w_hamming = hamming(N)';
h = hd.*w_hamming;
%绘图
subplot(221);stem(n,hd,'filled');
axis tight;xlabel('n');ylabel('hd(n)');
[Hr,w1] = zerophase(h);
subplot(222);plot(w1/pi,Hr);
axis tight;xlabel('\omega/\pi');ylabel('H(\omega)');
subplot(223);stem(n,h,'filled');
axis tight;xlabel('n');ylabel('h(n)');
[H,w] = freqz(h,1);
subplot(224);plot(w/pi,20*log10(abs(H)/max(abs(H))));
xlabel('\omega/\pi');ylabel('dB');
grid on 
%% %Lab4_1_4
%滤波器长度N
wp = 0.2*pi;wst = 0.3*pi;
tr_width = wst-wp;
N = ceil(11*pi/tr_width)+1;
%单位脉冲响应
n = 0:(N-1);wc = (wp+wst)/2;
alpha = (N-1)/2;
hd = (wc/pi)*sinc((wc/pi)*(n-alpha));
%加窗
w_blackman = blackman(N)';
h = hd.*w_blackman;
%绘图
subplot(221);stem(n,hd,'filled');
axis tight;xlabel('n');ylabel('hd(n)');
[Hr,w1] = zerophase(h);
subplot(222);plot(w1/pi,Hr);
axis tight;xlabel('\omega/\pi');ylabel('H(\omega)');
subplot(223);stem(n,h,'filled');
axis tight;xlabel('n');ylabel('h(n)');
[H,w] = freqz(h,1);
subplot(224);plot(w/pi,20*log10(abs(H)/max(abs(H))));
xlabel('\omega/\pi');ylabel('dB');
grid on 
%% %Lab4_1_5
%滤波器长度N
wp = 0.2*pi;wst = 0.3*pi;As=50;
tr_width = wst-wp;
N = ceil((As-7.95)/(2.285*tr_width))+1;
beta=0.1101*(As-8.7);
%单位脉冲响应
n = 0:(N-1);wc = (wp+wst)/2;
alpha = (N-1)/2;
hd = (wc/pi)*sinc((wc/pi)*(n-alpha));
%加窗
w_kaiser = kaiser(N,beta)';
h = hd.*w_kaiser;
%绘图
subplot(221);stem(n,hd,'filled');
axis tight;xlabel('n');ylabel('hd(n)');
[Hr,w1] = zerophase(h);
subplot(222);plot(w1/pi,Hr);
axis tight;xlabel('\omega/\pi');ylabel('H(\omega)');
subplot(223);stem(n,h,'filled');
axis tight;xlabel('n');ylabel('h(n)');[H,w] = freqz(h,1);
subplot(224);plot(w/pi,20*log10(abs(H)/max(abs(H))));
xlabel('\omega/\pi');ylabel('dB');
grid on
%% Lab4_2
%滤波器长度N
wst1 = 0.2*pi;wp1 = 0.35*pi;
wp2 = 0.65*pi;wst2 = 0.8*pi;
tr_width = wp1-wst1;
N = ceil(11*pi/tr_width)+1;
%单位脉冲响应
n = 0:(N-1);
wc1 = (wst1+wp1)/2;
wc2 = (wst2+wp2)/2;
alpha = (N-1)/2;
hd = (wc2/pi)*sinc((wc2/pi)*(n-alpha)) - (wc1/pi)*sinc((wc1/pi)*(n-alpha));
%加窗
w_blackman = blackman(N)';
h = hd.*w_blackman;
%绘图
subplot(221);stem(n,hd,'filled');
axis tight;xlabel('n');ylabel('hd(n)');
[Hr,w1] = zerophase(h);
subplot(222);plot(w1/pi,Hr);
axis tight;
xlabel('\omega/\pi');
ylabel('H(\omega)');
subplot(223);
stem(n,h,'filled');
axis tight;
xlabel('n');
ylabel('h(n)');
[H,w] = freqz(h,1);
subplot(224);
plot(w/pi,20*log10(abs(H)/max(abs(H))));
xlabel('\omega/\pi');ylabel('dB');
grid on
%% %Lab4_3_1
N = 20;alpha = (N-1)/2;l = 0:N-1;wl = (2*pi/N)*l;
Hrs = [1,1,1,zeros(1,15),1,1]; %对理想滤波器幅度函数取样得到取样样本
Hdr = [1,1,0,0];wdl = [0,0.25,0.25,1]; %用于绘制理想滤波器幅度函数曲线
k1 = 0:floor((N-1)/2);k2 = floor((N-1)/2)+1:N-1;
angH = [-alpha*(2*pi)/N*k1,alpha*(2*pi)/N*(N-k2)]; %计算θ(k)
H = Hrs.*exp(j*angH); %计算H(k)
h = ifft(H,N); %计算h(n)
w = [0:500]*pi/500;
H = freqz(h,1,w); %计算频率响应
[Hr,wr] = zerophase(h); %计算设计滤波器的幅度函数
%绘图
subplot(221);plot(wdl,Hdr,wl(1:11)/pi,Hrs(1:11),'o');
axis([0,1,-0.1,1.1]);xlabel('\omega（\pi）');ylabel('Hr(k)');
subplot(222);stem(l,h,'filled');
axis([0,N-1,-0.1,0.3]);xlabel('n');ylabel('h(n)');
subplot(223);plot(wr/pi,Hr,wl(1:11)/pi,Hrs(1:11),'o');
axis([0,1,-0.2,1.2]);xlabel('\omega（\pi）');ylabel('Hr(ω)');
subplot(224);plot(w/pi,20*log10((abs(H)/max(abs(H)))));
axis([0,1,-50,5]);grid;xlabel('\omega（\pi）');ylabel('dB');
%% Lab4_3_2
N = 40;alpha = (N-1)/2;l = 0:N-1;wl = (2*pi/N)*l;
Hrs = [1,1,1,1,1,0.39,zeros(1,29),0.39,1,1,1,1]; %对理想滤波器幅度函数取样得到取样样本
Hdr = [1,1,0,0];wdl = [0,0.25,0.25,1]; %用于绘制理想滤波器幅度函数曲线
k1 = 0:floor((N-1)/2);k2 = floor((N-1)/2)+1:N-1;
angH = [-alpha*(2*pi)/N*k1,alpha*(2*pi)/N*(N-k2)]; %计算θ(k)
H = Hrs.*exp(j*angH); %计算H(k)
h = ifft(H,N); %计算h(n)
w = [0:500]*pi/500;
H = freqz(h,1,w); %计算频率响应
[Hr,wr] = zerophase(h); %计算设计滤波器的幅度函数
%绘图
subplot(221);plot(wdl,Hdr,wl(1:21)/pi,Hrs(1:21),'o');
axis([0,1,-0.1,1.1]);xlabel('\omega（\pi）');ylabel('Hr(k)');
subplot(222);stem(l,h,'filled');
axis([0,N-1,-0.1,0.3]);xlabel('n');ylabel('h(n)');
subplot(223);plot(wr/pi,Hr,wl(1:21)/pi,Hrs(1:21),'o');
axis([0,1,-0.2,1.2]);xlabel('\omega（\pi）');ylabel('Hr(ω)');
subplot(224);plot(w/pi,20*log10((abs(H)/max(abs(H)))));
axis([0,1,-50,5]);grid;xlabel('\omega（\pi）');ylabel('dB');
%% Lab4_3_3
N = 60;alpha = (N-1)/2;l = 0:N-1;wl = (2*pi/N)*l;
Hrs = [1,1,1,1,1,1,1,0.5929,0.1099,zeros(1,42),0.1099,0.5929,1,1,1,1,1,1,1]; %对理想滤波器幅度函数取样得到取样样本
Hdr = [1,1,0,0];
wdl = [0,0.25,0.25,1]; %用于绘制理想滤波器幅度函数曲线
k1 = 0:floor((N-1)/2);
k2 = floor((N-1)/2)+1:N-1;
angH = [-alpha*(2*pi)/N*k1,alpha*(2*pi)/N*(N-k2)]; %计算θ(k)
H = Hrs.*exp(j*angH); %计算H(k)
h = ifft(H,N); %计算h(n)
w = [0:500]*pi/500;
H = freqz(h,1,w); %计算频率响应
[H,w] = freqz(h,1,w); %计算设计滤波器的幅度函数
Hr = abs(H);
%绘图
subplot(221);
plot(wdl,Hdr,wl(1:31)/pi,Hrs(1:31),'o');
axis([0,1,-0.1,1.1]);
xlabel('\omega（\pi）');
ylabel('Hr(k)');
subplot(222);
stem(l,h,'filled');
axis([0,N-1,-0.1,0.3]);
xlabel('n');
ylabel('h(n)');
subplot(223);
plot(w/pi,Hr,wl(1:31)/pi,Hrs(1:31),'o');
axis([0,1,-0.2,1.2]);
xlabel('\omega（\pi）');
ylabel('Hr(ω)');
subplot(224);
plot(w/pi,20*log10((abs(H)/max(abs(H)))));
axis([0,1,-50,5]);
grid;xlabel('\omega（\pi）');
ylabel('dB');
%% %Lab4_4
N = 33;alpha = (N-1)/2;l = 0:N-1;wl = (2*pi/N)*l;
Hrs=[zeros(1,11),0.1095,0.598,ones(1,7),0.598,0.1095,zeros(1,11)];
Hdr=[0,0,0.1095,0.598,1,1];wdl=[0,20/33,22/33,24/33,26/33,1];
k1 = 0:floor((N-1)/2);k2 = floor((N-1)/2)+1:N-1;
angH = [-alpha*(2*pi)/N*k1,alpha*(2*pi)/N*(N-k2)]; %计算θ(k)
H = Hrs.*exp(j*angH); %计算H(k)
h = ifft(H,N); %计算h(n)
w = [0:500]*pi/500;
H = freqz(h,1,w); %计算频率响应
[H,w] = freqz(h,1,w); %计算设计滤波器的幅度函数
Hr = abs(H);
%绘图
subplot(221);plot(wdl,Hdr,wl(1:17)/pi,Hrs(1:17),'o');
axis([0,1,-0.1,1.1]);
xlabel('\omega（\pi）');
ylabel('Hr(k)');
subplot(222);stem(l,h,'filled');
axis([0,N-1,-0.1,0.3]);xlabel('n');ylabel('h(n)');
subplot(223);plot(w/pi,Hr,wl(1:17)/pi,Hrs(1:17),'o');
axis([0,1,-0.2,1.2]);xlabel('\omega（\pi）');ylabel('Hr(ω)');
subplot(224);plot(w/pi,20*log10((abs(H)/max(abs(H)))));
axis([0,1,-120,5]);grid;xlabel('\omega（\pi）');ylabel('dB');

