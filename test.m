clear,clc;
img = imread('image2/IM-0001-0001.jpg');
img = rgb2gray(img);
img = imresize(img,0.125);
%---
% produce the down-scaling matrix A



P = UnderSamplingMatrix(2,size(img,1),size(img,2));
P = eye(4096);

x =double(reshape(img,[],1));

F = dftmtx(size(x,1));
%real_f = real(F);
H = dctmtx(4096);

A = P*F;
%y = A*x;
y = F*x;

%temp = dwt(x,'sym4');
%H = temp*x^(-1);
%-----------
rho = 0.00001;
tic;
%x_1 = F'*(P'*P + rho*F*H'*H*F')\(P'*y);
x_1 = F'*(eye(4096)+rho*F*H'*H*F')\y;
toc;
time_1 = toc;
c_1 = H * x_1;
q = sft_threshold_func(10,0.01,1);
z_1 = PLF(c_1,q);
ng = 0.01;
beta_1 = ng*(c_1-z_1);
tic;
x_2 = F'*(P'*P + rho*F*H'*H*F')\(P'*y + rho*F*H'*(z_1-beta_1));
toc;
time_2 = toc;
