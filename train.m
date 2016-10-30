%
%  train.m
%  ADMM-NET
%
%  Created by Liao Tinghui.SCU on 30/10/16.
%  Copyright (C) 2016 Deep ADMM NETWORK. SCU. All rights reserved.
clc;
clear all;
%This script is aim to finish the whole process of training;
%In this vision,every step is not finished because of no real image.
%The main structure is as follows.

%============STEP 1 Read Images==============%
% read images;
% convert matrix to vetcors as input X(1) and output y.

%============STEP 2 Initialize Net Parameters==============%
% build certain layer-net (eg. ADMM 17 or 18)
% random Initialize the parameters (like rho,eta, PLF...)
% Initialize the D( The filters ), g(0 or 1 norm), H(The filters ..)

%============STEP 3 Net Forward ==============%
% calculate all the 4 layer in ONE stage
% X->C
% C->Z
% Z,C->M
% get M to next X, M to next, M to next M, Z to next X.
% repeat until last layer
% calculate COST (||fx-y||2)

%============STEP 3 Net Backpropagation ==============%
% calculate all the 4 layer gradient in one stage
% X->M,Z
% M->Z,C,last M
% Z-> C,last M
% repeat until first layer
% use L-BFGS to minimize the COST and get the OPTIMIZED parameters

%============STEP 4 Predict & Test ==============%
% use one image to test the result.
% plot the curve of layers/error

% Tips: This is the structure for only ONE image.