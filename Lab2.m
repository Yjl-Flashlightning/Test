%Lab2_1
M=input("请输入参数：");
L=M;
n1=0:L;
n2=0:M;
x=heaviside(n1)-heaviside(n1-L);
h=cos(0.2*pi*n2);
disp('线性卷积');
tic
y1=conv(x,h);
toc
disp('快速卷积');
tic 
X=fft(x,M+L+1);
H=fft(h,M+L+1);
Y=X.*H;
y2=ifft(Y);
toc
%% %Lab2_2
L=input("请输入参数L：");
M=input("请输入参数M：");
n1=0:L;
n2=0:M;
x=heaviside(n1)-heaviside(n1-L);
h=cos(0.2*pi*n2);
disp('线性卷积');
tic
y1=conv(x,h);
toc
disp('快速卷积');
tic 
X=fft(x,M+L+1);
H=fft(h,M+L+1);
Y=X.*H;
y2=ifft(Y);
toc
%% %Lab2_3
L=2048;
M=256;
n1=0:L;
n2=0:M;
x=heaviside(n1)-heaviside(n1-L);
h=cos(0.2*pi*n2);
disp('快速卷积');
tic 
X=fft(x,M+L+1);
H=fft(h,M+L+1);
Y=X.*H;
y1=ifft(Y);
toc
disp('重叠相加');
tic
N=16;
Lx=N-M;
H=fft(h,N);
k=ceil((L+1)/Lx);
for i=L:k*Lx-1
    x(i+1)=0;
end
Y_2=zeros(k,N);
Y2=zeros(1,(k-1)*Lx+N);
for K=0:k-1
    Xk=[x(K*Lx+1:K*Lx+Lx),zeros(1,M)];
    Y_2(K+1,:)=(ifft(fft(Xk).*H));
    Y2(K*Lx+1:K*Lx+N)=Y_2(K*Lx+1:K*Lx+N)+Y_2(K+1,:);
end
toc
%% %Lab2_4
L=2048;
M=256;
n1=0:L;
n2=0:M;
x=heaviside(n1)-heaviside(n1-L);
h=cos(0.2*pi*n2);
disp('快速卷积');
tic
X=fft(x,M+L+1);
H=fft(h,M+L+1);
Y=X.*H;
y1=ifft(Y);
toc
disp('重叠保留');
tic
N=16;
Lx=N-M;
H=fft(h,N);
k=ceil((L+M-1)/Lx);
z=k*Lx-L;
x1=[zeros(1,M),x,zeros(1,z)];
Y_2=zeros(k,N);
Y2=zeros(1,(k-1)*Lx+N);
for K=0:k-1
    Xk=fft(x1(K*Lx+1:K*Lx+N));
    Y_2(K+1,:)=(ifft(Xk).*H);
end
Y2=reshape(Y_2(:,M:N)',1,[]);
toc
