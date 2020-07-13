function  test_DES_dep(iters_num,gpu_id,resolution)
%% setting caffe test config
addpath('./flownet2-master/');
use_gpu= 1;
% Set caffe mode
if exist('use_gpu', 'var') && use_gpu
  caffe.set_mode_gpu();
%   gpu_id = 0;  % we will use the first gpu in this demo
  caffe.set_device(gpu_id);
else
  caffe.set_mode_cpu();
end
%% Initialize the network
% change to your path...
net_model = fullfile('./flownet2-master/models/test_RGBD.prototxt');
net_weights = fullfile('./flownet2-master/models/',['RGBD_iter_' num2str(iters_num) '.caffemodel']);

end
phase = 'test'; 
net = caffe.Net(net_model, net_weights, phase);
%% load images from different Datasets
% change to your path....
imPath = './flownet2-master/datasets/DES/RGB/';
DepthPath = './flownet2-master/datasets/DES/depth/';
salPath = './flownet2-master/salmaps/DES/';
if ~exist(fullfile(salPath),'dir')
   mkdir(fullfile(salPath));
end
files = dir([imPath '*.jpg']);
num = length(files);
time = 0;
%% test each image
for i = 1 : num
    im = imread([imPath files(i).name]);
    if size(im,3)==1
        im = cat(3,im,im,im);
    end
    Depthim = (imread([DepthPath files(i).name(1:end-4) '.png' ]));

    % do forward pass to get scores
    res = net.forward({prepare_image(im,resolution), prepare_Depthimage(Depthim,resolution)});
    salmap = permute(res{1}(:,:,2), [2 1 3]);
    salmap = imresize(salmap,[size(im,1) size(im,2)], 'bilinear');
    imwrite(salmap, fullfile(salPath, [files(i).name(1:end-4) '.png']));

end
    caffe.reset_all();
end
%% --------------------  prepare images  ---------------------------------
function images = prepare_image(im,resolution)
% ------------------------------------------------------------------------
IMAGE_DIM = resolution;
% resize to fixed input size
im = single(im);
im = imresize(im, [IMAGE_DIM IMAGE_DIM], 'bilinear');
% permute from RGB to BGR (IMAGE_MEAN is already BGR)
im = im(:,:,[3 2 1]);
im(:,:,1) = im(:,:,1) -104.00699 ;  
im(:,:,2) = im(:,:,2) -116.66877 ;
im(:,:,3) = im(:,:,3) -122.67892 ;
images = permute(im,[2 1 3]);
% ------------------------------------------------------------------------
end
function Depthimages = prepare_Depthimage(Depthim,resolution)
% ------------------------------------------------------------------------
IMAGE_DIM = resolution;
% resize to fixed input size
Depthim = single(Depthim);
Depthim = imresize(Depthim, [IMAGE_DIM IMAGE_DIM], 'bilinear');
Depthim = Depthim(:,:,[3 2 1]);
Depthimages = permute(Depthim,[2 1 3]);
% ------------------------------------------------------------------------
end
