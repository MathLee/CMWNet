# CMWNet
   This project provides the codes and results for 'Cross-Modal Weighting Network for RGB-D Salient Object Detection', ECCV 2020. [Springer link](https://link.springer.com/chapter/10.1007/978-3-030-58520-4_39) or [arxiv link](https://arxiv.org/pdf/2007.04901.pdf) [Homepage](https://mathlee.github.io/)
   
   Our code is implemented based on the Caffe of FlowNet2. You should first install and compile the caffe according to the [FlowNet2](https://github.com/lmb-freiburg/flownet2). 

# Torch Vision
   https://github.com/lartpang/CMWNet.pytorch

# Overview and Module details
   Overview:

   ![Image](https://github.com/MathLee/CMWNet/blob/master/Images/Network_Overview.png)

   Module details:

   ![Image](https://github.com/MathLee/CMWNet/blob/master/Images/Module_details.png)
  
# Saliency maps and Measure results on 8 Datasets
   We provide [saliency maps](https://pan.baidu.com/s/1ShP41pA04YEx_bLuBOlDHg) (code: 6f2j) and [measure results](https://pan.baidu.com/s/1gmswn6s7jbpj7byndanYhg) (code: p0y7) of our CMWNet on 8 datasets (STEREO, NJU2K, LFSD, DES, NLPR, SSD, SIP and additional DUT-RGBD).

   You can use the [evaluation tool](https://github.com/MathLee/MatlabEvaluationTools) to evaluate the result maps.
   
   The parameter amount of our CMWNet is 85.61M.
   
   The FLOPs of our CMWNet is 322.34G.

# Testing
1. `test_RGBD.prototxt/` is under `models/`.
2. Download the [trained model](https://pan.baidu.com/s/12LAIiOL1ohq7i9S0nsxZrg) (code: z2o4) (`RGBD_iter_22500.caffemodel`), and put it under `models/`.
3. The datasets are under `datasets/`, we provide some testing examples on DES dataset.
4. Run `test_matlab/test_CMWNet.m`.
5. Saliency maps are under `salmaps/DES/`.

# Related works on RGB-D SOD
   (**TIP_2021_HAINet**) [Hierarchical Alternate Interaction Network for RGB-D Salient Object Detection](https://github.com/MathLee/HAINet).
   
   (**TIP_2020_ICNet**) [ICNet: Information Conversion Network for RGB-D Based Salient Object Detection](https://github.com/MathLee/ICNet-for-RGBD-SOD).
   
   (**Survey**) [RGB-D Salient Object Detection: A Survey](https://github.com/taozh2017/RGBD-SODsurvey).
   
# Citation
        @inproceedings{Li_2020_CMWNet,
                author = {Li, Gongyang and Liu, Zhi and Ye, Linwei and Wang, Yang and Ling, Haibin},
                title = {Cross-Modal Weighting Network for RGB-D Salient Object Detection},
                journal = {European Conference on Computer Vision (ECCV)},
                year = {2020},
                pages = {665-681},
                month = {Aug.},}

If you encounter any problems with the code, want to report bugs, etc.

Please contact me at lllmiemie@163.com or ligongyang@shu.edu.cn.
