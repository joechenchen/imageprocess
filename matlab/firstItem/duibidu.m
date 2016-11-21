CONST_PARAM = -10;      %对比度参数

BRI_PARAM = 0;          %亮度参数

mypic = imread('d:/Matlab/image/lena.jpg');%读取RGB格式的图像

[rows,cols,colors] = size(mypic);%得到原图像的矩阵的参数,求图像维数，RGB M*N*3 GRAY M*N

figure(1)
%原图
subplot(131)
imshow(mypic);
title('原图')

% 自带算法
suanfapic = imadjust(mypic,[75/255,160/255],[0,1]);
subplot(132)
imshow(suanfapic);
title('自带算法')

img = zeros(rows,cols,colors);
mypic = double(mypic);
% 调整图像亮度与对比度算法主要由以下几个步骤组成：
% 
% 1.      计算图像的RGB像素均值– M
% 
% 2.      对图像的每个像素点Remove平均值-M
% 
% 3.      对去掉平均值以后的像素点 P乘以对比度系数
% 
% 4.      对步骤上处理以后的像素P加上M乘以亮度系统/对步骤上处理以后的像素P加上M + 亮度
% 
% 5.      对像素点RGB值完成重新赋值

rmean = zeros(1);
gmean = zeros(1);
bmean = zeros(1);
sum = rows * cols;
for i = 1:rows
    for j = 1:cols
       rmean  = rmean + mypic(i,j,1);
       gmean  = gmean + mypic(i,j,2);
       bmean  = bmean + mypic(i,j,3);
    end
end
rmean = rmean /sum;
gmean = gmean /sum;
bmean = bmean /sum;

% rmean = 127;
% gmean = 127;
% bmean = 127; 
%减去平均值
for i = 1:rows
    for j = 1:cols
        img(i,j,1) = mypic(i,j,1) - rmean;        %RED Channel

        img(i,j,2) = mypic(i,j,2) - gmean;       %GREEN Channel

        img(i,j,3) = mypic(i,j,3) - bmean;      %BLUE Channle

        % Adjust Contrast 

        img(i,j,1) = img(i,j,1) * CONST_PARAM;      %RED Channel

        img(i,j,2) = img(i,j,2) * CONST_PARAM;      %GREEN Channel

        img(i,j,3) = img(i,j,3) * CONST_PARAM;      %BLUE Channle

        % Adjust Brightness

        img(i,j,1) = img(i,j,1) + rmean + BRI_PARAM;       %RED Channel

        img(i,j,2) = img(i,j,2) + gmean + BRI_PARAM;     %GREEN Channel

        img(i,j,3) = img(i,j,3) + bmean + BRI_PARAM; 
    end
end


% outpic = zeros(rows,cols,colors);
% outpic = uint8(outpic);

img = uint8(img);


subplot(133)
imshow(img);
title('我的算法')

% %减去平均值
% secondpic = zeros(rows,cols,colors);%用得到的参数创建一个全零的矩阵，这个矩阵用来存储灰度图像
% secondpic = uint8(secondpic);%将创建的全零矩阵转化为uint8格式，因为用上面的语句创建之后图像是double类型
% for i = 1:rows
%     for j = 1:cols
%         secondpic(i,j,1) = mypic(i,j,1)-127;
%         secondpic(i,j,2) = mypic(i,j,2)-127;
%         secondpic(i,j,3) = mypic(i,j,3)-127;
%     end
% end
% 
% 
% 
% 
% %调节对比度系数
% thirdpic = zeros(rows,cols,colors);%用得到的参数创建一个全零的矩阵，这个矩阵用来存储灰度图像
% thirdpic = uint8(thirdpic);%将创建的全零矩阵转化为uint8格式，因为用上面的语句创建之后图像是double类型
% for i = 1:rows
%     for j = 1:cols
%         thirdpic(i,j,1) = secondpic(i,j,1)* CONST_PARAM;
%         thirdpic(i,j,2) = secondpic(i,j,2)* CONST_PARAM;
%         thirdpic(i,j,3) = secondpic(i,j,3)* CONST_PARAM;
%     end
% end
% 
% %调节亮度
% %调节对比度系数
% outpic = zeros(rows,cols,colors);%用得到的参数创建一个全零的矩阵，这个矩阵用来存储灰度图像
% outpic = uint8(outpic);%将创建的全零矩阵转化为uint8格式，因为用上面的语句创建之后图像是double类型
% for i = 1:rows
%     for j = 1:cols
%         outpic(i,j,1) = thirdpic(i,j,1)+ 127 + BRI_PARAM;
%         outpic(i,j,2) = thirdpic(i,j,2)+ 127 + BRI_PARAM;
%         outpic(i,j,3) = thirdpic(i,j,3)+ 127 + BRI_PARAM;
%     end
% end
% 
% % redsum = sum(sum(mypic(:,:,1)));
% % greensum = sum(sum(mypic(:,:,2)));
% % bluesum = sum(sum(mypic(:,:,3)));
% 
% % %求RGB的平均值
% % redavg = uint8(mean(mean(mypic(:,:,1))));
% % greenavg = uint8(mean(mean(mypic(:,:,2))));
% % blueavg = uint8(mean(mean(mypic(:,:,3))));
% % 
% % %减去平均值
% % secondpic = zeros(rows,cols,colors);%用得到的参数创建一个全零的矩阵，这个矩阵用来存储灰度图像
% % secondpic = uint8(secondpic);%将创建的全零矩阵转化为uint8格式，因为用上面的语句创建之后图像是double类型
% % for i = 1:rows
% %     for j = 1:cols
% %         secondpic(i,j,1) = mypic(i,j,1)-redavg;
% %         secondpic(i,j,2) = mypic(i,j,2)-greenavg;
% %         secondpic(i,j,3) = mypic(i,j,3)-blueavg;
% %     end
% % end
% % 
% % %乘以对比数系数,取值范围0-4
% % thirdpic = zeros(rows,cols,colors);%用得到的参数创建一个全零的矩阵，这个矩阵用来存储灰度图像
% % thirdpic = uint8(thirdpic);%将创建的全零矩阵转化为uint8格式，因为用上面的语句创建之后图像是double类型
% % for i = 1:rows
% %     for j = 1:cols
% %         for k = 1:colors  
% %             thirdpic(i,j,k) =  secondpic(i,j,k)*2;
% %         end
% %     end
% % end
% % 
% % %+平均值picavg 然后乘以亮度系数，最佳取值范围[0-2]之间
% % forthpic = zeros(rows,cols,colors);%用得到的参数创建一个全零的矩阵，这个矩阵用来存储灰度图像
% % forthpic = uint8(forthpic);%将创建的全零矩阵转化为uint8格式，因为用上面的语句创建之后图像是double类型
% % for i = 1:rows
% %     for j = 1:cols
% %         forthpic(i,j,1) =  thirdpic(i,j,1)+ redavg*1;
% %         forthpic(i,j,2) =  thirdpic(i,j,2)+ greenavg*1;
% %         forthpic(i,j,3) =  thirdpic(i,j,3)+ blueavg*1;
% %     end
% % end
% % 
% % %对像素点RGB值重新完成赋值
% % endpic = zeros(rows,cols,colors);%用得到的参数创建一个全零的矩阵，这个矩阵用来存储灰度图像
% % endpic = uint8(endpic);%将创建的全零矩阵转化为uint8格式，因为用上面的语句创建之后图像是double类型
% % 
% % for i = 1:rows
% %     for j = 1:cols
% %         for k = 1:colors  
% %             endpic(i,j,k) =  thirdpic(i,j,k);
% %         end
% %     end
% % end
% 
% figure(1)
% %原图
% subplot(131)
% imshow(mypic);
% title('原图')
% 
% %自带算法
% suanfapic = imadjust(mypic,[75/255,160/255],[0,1]);
% subplot(132)
% imshow(suanfapic);
% title('自带算法')
% 
% subplot(133)
% imshow(outpic);
% title('我的算法')








