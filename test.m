clear,clc;
reset(gpuDevice(1));
img = imread('image2/IM-0001-0001.jpg');
img = rgb2gray(img);
img = imresize(img,0.125);
%---
% produce the down-scaling matrix A
P = UnderSamplingMatrix(2,size(img,1),size(img,2));
x = gpuArray(double(reshape(img,[],1)));

F = dftmtx(size(x,1));
F = gpuArray(F);
%real_f = real(F);
Hc = dctmtx(4096);
H = gpuArray(Hc);

A = P*F;
y = A*x;
%temp = dwt(x,'sym4');
%H = temp*x^(-1);
%-----------
rho = rand(1);
x_1 = F'*(P'*P + rho.*F*H*H'*F')/(P'*y);
c_1 = H * x_1;
q = rand(10,1);
z_1 = PLF(c_1,q);
ng = rand(1);
beta_1 = ng*(c_1-z_1');
x_2 = F'*inv(P'*P + rho*F*H*H'*F')*(P'*y + rho*F*H'*(z_1'-c_1));
