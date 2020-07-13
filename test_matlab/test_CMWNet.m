clear;
clc;
close all;

%################################### Inference Saliency Map ##################################
% This code is used for CMWNet 
% Code Author: Gongyang Li
% Email: lllmiemie@163.com, ligongyang@shu.edu.cn
% Date: 13/7/2020
% The code is based on the following paper in ECCV2020:
% Title: Cross-Modal Weighting Network for RGB-D Based Salient Object Detection
% Authors: Gongyang Li, Zhi Liu*, Linwei Ye, Yang Wang, and Haibin Ling
%#############################################################################################

gpu_id = 1;
resolution = 288;
%% Producing the saliency map of DES dataset
display(['Producing the saliency map of DES dataset.']);
mIoU = test_DES_dep(22500,gpu_id,resolution);

