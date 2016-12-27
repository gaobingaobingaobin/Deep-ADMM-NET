%load Test_single_layer.m;

% what we need, Theta includes following parameters: {q,D,H,rho,eta } in
% every layer n *plus* {H,rho} in every filter L.

% BP initialization;
m_size = 4096;
B_3 = H;
B_2 = H;
B_1 = H;
H_3 = {H};
x_3 = real(x_3);
x_gt = double(reshape(img,[],1));
E = norm(x_3-x_gt)/norm(x_gt);

%---Third Layer---
% BP Reconstruction Layer3-----
fprintf('BP ReconstructionLayer3\n');
tic;
% E gradient
E_2_x3 = (x_3-x_gt)/(norm(x_gt)*norm(x_3-x_gt));
% input gradient
Q = (P'*P+rho_3{1}*F*H_3{1}'*H_3{1}*F')^(-1);
x3_2_gama3 = -rho_3{1}*F'*(Q^2*(F*B_3'*H_3{1}*F'+F*H_3{1}'*B_3*F')*(P'*y+rho_3{1}*F*H_3{1}'*(z_2{1}-beta_2{1}))-Q*F*B_3'*(z_2{1}-beta_2{1}));
x3_2_rho3{1} = -F'*(Q^2*(F*H_3{1}'*H_3{1}*F')*(P'*y+rho_3{1}*F*H_3{1}'*(z_2{1}-beta_2{1}))-Q*F*H_3{1}'*(z_2{1}-beta_2{1}));
x3_2_beta2 = -rho_3{1}*F'*Q*F*H_3{1}';
x3_2_z2 = rho_3{1}*F'*Q*F*H_3{1}';

% output gradient(some of them will be used in upcoming steps in the network while others will be used in L-BFGS)
% these gradients can be used directly, because they are in Theta:
E_2_gama3 = x3_2_gama3' * E_2_x3;
E_2_rho3{1} = x3_2_rho3{1}' * E_2_x3;

% these gradients will be used in upcoming steps:
E_2_beta2_first = x3_2_beta2' * E_2_x3;
E_2_z2_first = x3_2_z2' * E_2_x3;
toc;
% BP Reconstruction Layer3 END-----

%---Second Layer---
% BP Multiplier update Layer2-----
fprintf('BP MultiplierUpdateLayer2\n');
tic;
% E gradient
E_2_beta2 = E_2_beta2_first;

% input gradient
beta2_2_eta2 = c_2{1} - z_2{1};
beta2_2_c2 = eta_2{1}*eye(m_size);
beta2_2_z2 = -beta2_2_c2;
beta2_2_beta1 = eye(m_size);

% output gradient
% these gradients can be used directly, because they are in Theta:
E_2_eta2 = beta2_2_eta2'* E_2_beta2;
% these gradients will be used in upcoming steps:
E_2_c2_first = beta2_2_c2' * E_2_beta2;
E_2_z2_second = beta2_2_z2' * E_2_beta2;
E_2_beta1_first = beta2_2_beta1' * E_2_beta2;
toc;
% BP MultiplierUpdate Layer 2 END-----

% BP Nonlinear Transform Layer 2-----
fprintf('BP NonlinearTransformLayer2\n');
tic;
% E gradient
E_2_z2 = E_2_z2_first + E_2_z2_second;
% input gradient
z2_2_q2 = sft_func_bp_z2q(10,c_2{1}+beta_1{1});