mypic = imread('d:/Matlab/image/lena.jpg');%��ȡRGB��ʽ��ͼ��
myfirstgraypic = rgb2gray(mypic);%�����еĺ�������RGB���Ҷ�ͼ���ת��

[rows,cols,colors] = size(mypic);%�õ�ԭͼ��ľ���Ĳ���,��ͼ��ά����RGB M*N*3 GRAY M*N

ThirdPic = zeros(rows,cols);
%��������ת����double����
ThirdPic1 = double(mypic);
for i = 1:rows
    for j = 1:cols
        ThirdPic(i,j)=0.3*ThirdPic1(i,j,1)+0.59*ThirdPic1(i,j,2)+0.11*ThirdPic1(i,j,3);  %��Ȩƽ��ֵ��
%         ThirdPic(i,j,2)=0.3*ThirdPic(i,j,1)+0.59*ThirdPic(i,j,2)+0.11*ThirdPic(i,j,3);  %��Ȩƽ��ֵ��
%         ThirdPic(i,j,3)=0.3*ThirdPic(i,j,1)+0.59*ThirdPic(i,j,2)+0.11*ThirdPic(i,j,3);  %��Ȩƽ��ֵ��
    end  
end  

ThirdPic = uint8(ThirdPic);
%��ʾԭ����RGBͼ��
subplot(131)

imshow(mypic);  
title('ԭͼ') 
%��ʾ����ϵͳ����������ĻҶ�ͼ��  

subplot(132)

imshow(myfirstgraypic);  
title('�Դ��㷨')  
%��ʾת��֮��ĻҶ�ͼ��  

subplot(133)
imshow(ThirdPic);
title('��Ȩƽ��ֵ��')
        