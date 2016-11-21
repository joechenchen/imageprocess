mypic = imread('d:/Matlab/image/lena.jpg');%读取RGB格式的图像
myfirstgraypic = rgb2gray(mypic);%用已有的函数进行RGB到灰度图像的转换

[rows,cols,colors] = size(mypic);%得到原图像的矩阵的参数,求图像维数，RGB M*N*3 GRAY M*N

ThirdPic = zeros(rows,cols);
%浮点运算转换成double类型
ThirdPic1 = double(mypic);
for i = 1:rows
    for j = 1:cols
        ThirdPic(i,j)=0.3*ThirdPic1(i,j,1)+0.59*ThirdPic1(i,j,2)+0.11*ThirdPic1(i,j,3);  %加权平均值法
%         ThirdPic(i,j,2)=0.3*ThirdPic(i,j,1)+0.59*ThirdPic(i,j,2)+0.11*ThirdPic(i,j,3);  %加权平均值法
%         ThirdPic(i,j,3)=0.3*ThirdPic(i,j,1)+0.59*ThirdPic(i,j,2)+0.11*ThirdPic(i,j,3);  %加权平均值法
    end  
end  

ThirdPic = uint8(ThirdPic);
%显示原来的RGB图像
subplot(131)

imshow(mypic);  
title('原图') 
%显示经过系统函数运算过的灰度图像  

subplot(132)

imshow(myfirstgraypic);  
title('自带算法')  
%显示转化之后的灰度图像  

subplot(133)
imshow(ThirdPic);
title('加权平均值法')
        