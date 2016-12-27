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
q_1 = {sft_threshold_func(10,lambda,rho_2{1})};
beta_0 = {zeros(4096,1)};
z_0 = {zeros(4096,1)};
eta_1 = {0.01};

%---First Layer---

% ReconstructionLayer
fprintf('ReconstructionLayer\n');
tic;
x_1 = ReconstructionLayer(F,P,H_1,beta_0,y,rho_1,z_0);
toc;
% ConvolutionLayer
fprintf('ConvolutionLayer\n');
tic;
c_1 = ConvolutionLayer(x_1,D_1);
toc;
% NonlinearTransformLayer
fprintf('NonlinearTransformLayer\n');
tic;
z_1 = NonlinearTransformLayer(c_1,beta_0,q_1);
toc;
% MultiplierUpdateLayer
fprintf('MultiplierUpdateLayer\n');
tic;
beta_1 = MultiplierUpdateLayer(beta_0,eta_1,c_1,z_1);
toc;

%---Second Layer---
rho_3 = {0.03};
q_2 = {sft_threshold_func(10,lambda,rho_3{1})};
eta_2 = {0.01};
H_2 = {H};
D_2 = {H};
% ReconstructionLayer 2
fprintf('ReconstructionLayer2\n');
tic;
x_2 = ReconstructionLayer(F,P,H_1,beta_1,y,rho_2,z_1);
toc;
% ConvolutionLayer2
fprintf('ConvolutionLayer2\n');
tic;
c_2 = ConvolutionLayer(x_2,D_2);
toc;
% NonlinearTransformLayer2
fprintf('NonlinearTransformLayer2\n');
tic;
z_2 = NonlinearTransformLayer(c_2,beta_1,q_2);
toc;
% MultiplierUpdateLayer2
fprintf('MultiplierUpdateLayer2\n');
tic;
beta_2 = MultiplierUpdateLayer(beta_1,eta_2,c_2,z_2);
toc;
% ReconstructionLayer 3
fprintf('ReconstructionLayer3\n');
tic;
x_3 = ReconstructionLayer(F,P,H_2,beta_2,y,rho_3,z_2);
toc;