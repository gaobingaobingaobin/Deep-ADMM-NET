%--load image__%
clear,clc;
img = imread('image2/IM-0001-0001.jpg');
img = rgb2gray(img);
img = imresize(img,0.125);

%--Initialization__%
P = eye(4096);
x =double(reshape(img,[],1));
F = dftmtx(size(x,1));
H = dctmtx(4096);
H_1 = {H};
D_1 = {H};
A = P*F;
y = A*x;
rho_1 = {0.00001};
lambda = 0.01;
rho_2 = {0.006};
q = {sft_threshold_func(10,lambda,rho_2{1})};
beta_0 = {zeros(4096,1)};
z_0 = {zeros(4096,1)};
eta_1 = {0.01};
% ReconstructionLayer
tic;
x_1 = ReconstructionLayer(F,P,H_1,beta_0,y,rho_1,z_0);
toc;
% ConvolutionLayer
tic;
c_1 = ConvolutionLayer(x_1,D_1);
toc;
% NonlinearTransformLayer
tic;
z_1 = NonlinearTransformLayer(c_1,beta_0,q);
toc;
% MultiplierUpdateLayer
tic;
beta_1 = MultiplierUpdateLayer(beta_0,eta_1,c_1,z_1);
toc;

% ReconstructionLayer 2
tic;
x_2 = ReconstructionLayer(F,P,H_1,beta_1,y,rho_2,z_1);
toc;
