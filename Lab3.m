%Lab3_1_1
fs=5000;  %采样率
fp=1000;
fst=1500;
Rp=1;
As=15;
Wp=2*pi*fp/fs;
Wst=2*pi*fst/fs;
N=ceil((log10((10^(Rp/10)-1)/(10^(As/10)-1)))/(2*log10(Wp/Wst)));
OmegaC1=Wp*fs/((10^(Rp/10)-1)^(1/(2*N)));
OmegaC2=Wst*fs/((10^(As/10)-1)^(1/(2*N)));
[b,a] = butter(N,OmegaC1,'s');
[bz,az] = impinvar(b,a,fs);
[H w]= freqz(bz,az,500);  %频率响应
subplot(221);
plot(w*fs/(2*pi),abs(H));
grid on;  %打开网格
xlabel('\omega(Hz)');
ylabel('|H(j\omega)|');
subplot(222);
plot(w*fs/(2*pi),20*log10((abs(H))/max(abs(H))));
grid on;
xlabel('\omega(Hz)');
ylabel('|H(j\omega)|,dB');
subplot(223);
plot(w*fs/(2*pi),angle(H)/pi);
grid on;
xlabel('\omega(Hz)');
ylabel('Phase of H(j\omega)(\pi)');
grd = grpdelay(bz,az,w);  %群时延响应
subplot(224);
plot(w*fs/(2*pi),grd);
grid on;
xlabel('\omega(Hz)');
ylabel('Group delay');
%% %Lab3_1_2
fs=5000;  %采样率
fp=1000;
fst=1500;
Rp=1;
As=15;
T=1/fs;
Wp=2*tan(2*pi*fp/(2*fs))/T;
Wst=2*tan(2*pi*fst/(2*fs))/T;
N=ceil((log10((10^(Rp/10)-1)/(10^(As/10)-1)))/(2*log10(Wp/Wst)));
OmegaC1=Wp/((10^(Rp/10)-1)^(1/(2*N)));
OmegaC2=Wst/((10^(As/10)-1)^(1/(2*N)));
[b,a] = butter(N,OmegaC1,'s');
[bz,az] = bilinear(b,a,fs);
[H,w] = freqz(bz,az);  %频率响应
subplot(221);
plot(w*fs/(2*pi),abs(H));
grid on;
xlabel('\omega(Hz)');
ylabel('|H(j\omega)|');
subplot(222);
plot(w*fs/(2*pi),20*log10((abs(H))/max(abs(H))));
grid on;
xlabel('\omega(Hz)');
ylabel('|H(j\omega)|,dB');
subplot(223);
plot(w*fs/(2*pi),angle(H)/pi);
grid on;
xlabel('\omega(Hz)');
ylabel('Phase of H(j\omega)(\pi)');
grd = grpdelay(bz,az,w);  %群时延响应
subplot(224);
plot(w*fs/(2*pi),grd);
grid on;
xlabel('\omega(Hz)');
ylabel('Group delay');
%% %Lab3_2_1
fs=5000;  %采样率
fp=1000;
fst=1500;
Rp=1;
As=15;
Wp=2*pi*fp/fs;
Wst=2*pi*fst/fs;
e=(10^(Rp/10)-1)^(1/2);
A=10^(As/20);
N=ceil((acosh(((A^2-1)^(1/2)))/e)/acosh(Wst/Wp));
OmegaC = Wp;
[b,a] = cheby1(N,Rp,OmegaC,'s');
[bz,az] = impinvar(b,a);
[H,w] = freqz(bz,az,500);  %频率响应
subplot(221);
plot(w*fs/(2*pi),abs(H));
grid on;
xlabel('\omega(Hz)');
ylabel('|H(j\omega)|');
subplot(222);
plot(w*fs/(2*pi),20*log10((abs(H))/max(abs(H))));
grid on;
xlabel('\omega(Hz)');
ylabel('|H(j\omega)|,dB');
subplot(223);
plot(w*fs/(2*pi),angle(H)/pi);
grid on;
xlabel('\omega(Hz)');
ylabel('Phase of H(j\omega)(\pi)');
grd = grpdelay(bz,az,w);  %群时延响应
subplot(224);
plot(w*fs/(2*pi),grd);
grid on;
xlabel('\omega(Hz)');
ylabel('Group delay');
%% %Lab3_2_2
fs=5000;  %采样率
fp=1000;
fst=1500;
Rp=1;
As=15;
T=1/fs;
Wp=2*tan(2*pi*fp/(2*fs))/T;
Wst=2*tan(2*pi*fst/(2*fs))/T;
e=(10^(Rp/10)-1)^(1/2);
A=10^(As/20);
N=ceil((acosh(((A^2-1)^(1/2)))/e)/acosh(Wst/Wp));
OmegaC = Wp;
[b,a] = cheby1(N,Rp,OmegaC,'s');
[bz,az] = bilinear(b,a,fs);
[H,w] = freqz(bz,az);  %频率响应
subplot(221);
plot(w*fs/(2*pi),abs(H));
grid on;
xlabel('\omega(Hz)');
ylabel('|H(j\omega)|');
subplot(222);
plot(w*fs/(2*pi),20*log10((abs(H))/max(abs(H))));
grid on;
xlabel('\omega(Hz)');
ylabel('|H(j\omega)|,dB');
subplot(223);
plot(w*fs/(2*pi),angle(H)/pi);
grid on;
xlabel('\omega(Hz)');
ylabel('Phase of H(j\omega)(\pi)');
grd = grpdelay(bz,az,w);  %群时延响应
subplot(224);
plot(w*fs/(2*pi),grd);
grid on;
xlabel('\omega(Hz)');
ylabel('Group delay');
%% %Lab3_3_1
fs=5000;  %采样率
fp=1000;
fst=1500;
Rp=1;
As=15;
Wp=2*pi*fp/fs;
Wst=2*pi*fst/fs;
e=(10^(Rp/10)-1)^(1/2);
A=10^(As/20);
N=ceil((acosh(((A^2-1)^(1/2)))/e)/acosh(Wst/Wp));
OmegaC = Wp;
[b,a] = cheby2(N,Rp,OmegaC,'s');
[bz,az] = impinvar(b,a);
[H,w] = freqz(bz,az,500);  %频率响应
subplot(221);
plot(w*fs/(2*pi),abs(H));
grid on;
xlabel('\omega(Hz)');
ylabel('|H(j\omega)|');
subplot(222);
plot(w*fs/(2*pi),20*log10((abs(H))/max(abs(H))));
grid on;
xlabel('\omega(Hz)');
ylabel('|H(j\omega)|,dB');
subplot(223);
plot(w*fs/(2*pi),angle(H)/pi);
grid on;
xlabel('\omega(Hz)');
ylabel('Phase of H(j\omega)(\pi)');
grd = grpdelay(bz,az,w);  %群时延响应
subplot(224);
plot(w*fs/(2*pi),grd);
grid on;
xlabel('\omega(Hz)');
ylabel('Group delay');
%% %Lab3_3_2
fs=5000;  %采样率
fp=1000;
fst=1500;
Rp=1;
As=15;
T=1/fs;
Wp=2*tan(2*pi*fp/(2*fs))/T;
Wst=2*tan(2*pi*fst/(2*fs))/T;
e=(10^(Rp/10)-1)^(1/2);
A=10^(As/20);
N=ceil((acosh(((A^2-1)^(1/2)))/e)/acosh(Wst/Wp));
OmegaC = Wp;
[b,a] = cheby2(N,Rp,OmegaC,'s');
[bz,az] = bilinear(b,a,fs);
[H,w] = freqz(bz,az);  %频率响应
subplot(221);
plot(w*fs/(2*pi),abs(H));
grid on;
xlabel('\omega(Hz)');
ylabel('|H(j\omega)|');
subplot(222);
plot(w*fs/(2*pi),20*log10((abs(H))/max(abs(H))));
grid on;
xlabel('\omega(Hz)');
ylabel('|H(j\omega)|,dB');
subplot(223);
plot(w*fs/(2*pi),angle(H)/pi);
grid on;
xlabel('\omega(Hz)');
ylabel('Phase of H(j\omega)(\pi)');
grd = grpdelay(bz,az,w);  %群时延响应
subplot(224);
plot(w*fs/(2*pi),grd);
grid on;
xlabel('\omega(Hz)');
ylabel('Group delay');
%% %Lab3_4_1
fs=5000;  %采样率
fp=1000;
fst=1500;
Rp=1;
As=15;
Wp=2*pi*fp/fs;
Wst=2*pi*fst/fs;
e=(10^(Rp/10)-1)^(1/2);
A=10^(As/20);
k=Wp/Wst;
k1=e/(A^2-1)^(1/2);
N=ceil((ellipke(k)*ellipke((1-k1^2)^(1/2)))/(ellipke(k1)*ellipke((1-k^2)^(1/2))));
OmegaC = Wp;
[b,a] = ellip(N,Rp,As,OmegaC,'s');
[bz,az] = impinvar(b,a);
[H,w] = freqz(bz,az,500);  %频率响应
subplot(221);
plot(w*fs/(2*pi),abs(H));
grid on;
xlabel('\omega(Hz)');
ylabel('|H(j\omega)|');
subplot(222);
plot(w*fs/(2*pi),20*log10((abs(H))/max(abs(H))));
grid on;
xlabel('\omega(Hz)');
ylabel('|H(j\omega)|,dB');
subplot(223);
plot(w*fs/(2*pi),angle(H)/pi);
grid on;
xlabel('\omega(Hz)');
ylabel('Phase of H(j\omega)(\pi)');
grd = grpdelay(bz,az,w);  %群时延响应
subplot(224);
plot(w*fs/(2*pi),grd);
grid on;
xlabel('\omega(Hz)');
ylabel('Group delay');
%% %Lab3_4_2
s=5000;  %采样率
fp=1000;
fst=1500;
Rp=1;
As=15;
T=1/fs;
Wp=2*tan(2*pi*fp/(2*fs))/T;
Wst=2*tan(2*pi*fst/(2*fs))/T;
e=(10^(Rp/10)-1)^(1/2);
A=10^(As/20);
k=Wp/Wst;
k1=e/(A^2-1)^(1/2);
N=ceil((ellipke(k)*ellipke((1-k1^2)^(1/2)))/(ellipke(k1)*ellipke((1-k^2)^(1/2))));
OmegaC = Wp;
[b,a] = ellip(N,Rp,As,OmegaC,'s');
[bz,az] = bilinear(b,a,fs);
[H,w] = freqz(bz,az,500);  %频率响应
subplot(221);
plot(w*fs/(2*pi),abs(H));
grid on;
xlabel('\omega(Hz)');
ylabel('|H(j\omega)|');
subplot(222);
plot(w*fs/(2*pi),20*log10((abs(H))/max(abs(H))));
grid on;
xlabel('\omega(Hz)');
ylabel('|H(j\omega)|,dB');
subplot(223);
plot(w*fs/(2*pi),angle(H)/pi);
grid on;
xlabel('\omega(Hz)');
ylabel('Phase of H(j\omega)(\pi)');
grd = grpdelay(bz,az,w);  %群时延响应
subplot(224);
plot(w*fs/(2*pi),grd);
grid on;
xlabel('\omega(Hz)');
ylabel('Group delay');

