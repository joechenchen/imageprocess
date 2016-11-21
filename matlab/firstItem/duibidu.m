CONST_PARAM = -10;      %�ԱȶȲ���

BRI_PARAM = 0;          %���Ȳ���

mypic = imread('d:/Matlab/image/lena.jpg');%��ȡRGB��ʽ��ͼ��

[rows,cols,colors] = size(mypic);%�õ�ԭͼ��ľ���Ĳ���,��ͼ��ά����RGB M*N*3 GRAY M*N

figure(1)
%ԭͼ
subplot(131)
imshow(mypic);
title('ԭͼ')

% �Դ��㷨
suanfapic = imadjust(mypic,[75/255,160/255],[0,1]);
subplot(132)
imshow(suanfapic);
title('�Դ��㷨')

img = zeros(rows,cols,colors);
mypic = double(mypic);
% ����ͼ��������Աȶ��㷨��Ҫ�����¼���������ɣ�
% 
% 1.      ����ͼ���RGB���ؾ�ֵ�C M
% 
% 2.      ��ͼ���ÿ�����ص�Removeƽ��ֵ-M
% 
% 3.      ��ȥ��ƽ��ֵ�Ժ�����ص� P���ԶԱȶ�ϵ��
% 
% 4.      �Բ����ϴ����Ժ������P����M��������ϵͳ/�Բ����ϴ����Ժ������P����M + ����
% 
% 5.      �����ص�RGBֵ������¸�ֵ

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
%��ȥƽ��ֵ
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
title('�ҵ��㷨')

% %��ȥƽ��ֵ
% secondpic = zeros(rows,cols,colors);%�õõ��Ĳ�������һ��ȫ��ľ���������������洢�Ҷ�ͼ��
% secondpic = uint8(secondpic);%��������ȫ�����ת��Ϊuint8��ʽ����Ϊ���������䴴��֮��ͼ����double����
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
% %���ڶԱȶ�ϵ��
% thirdpic = zeros(rows,cols,colors);%�õõ��Ĳ�������һ��ȫ��ľ���������������洢�Ҷ�ͼ��
% thirdpic = uint8(thirdpic);%��������ȫ�����ת��Ϊuint8��ʽ����Ϊ���������䴴��֮��ͼ����double����
% for i = 1:rows
%     for j = 1:cols
%         thirdpic(i,j,1) = secondpic(i,j,1)* CONST_PARAM;
%         thirdpic(i,j,2) = secondpic(i,j,2)* CONST_PARAM;
%         thirdpic(i,j,3) = secondpic(i,j,3)* CONST_PARAM;
%     end
% end
% 
% %��������
% %���ڶԱȶ�ϵ��
% outpic = zeros(rows,cols,colors);%�õõ��Ĳ�������һ��ȫ��ľ���������������洢�Ҷ�ͼ��
% outpic = uint8(outpic);%��������ȫ�����ת��Ϊuint8��ʽ����Ϊ���������䴴��֮��ͼ����double����
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
% % %��RGB��ƽ��ֵ
% % redavg = uint8(mean(mean(mypic(:,:,1))));
% % greenavg = uint8(mean(mean(mypic(:,:,2))));
% % blueavg = uint8(mean(mean(mypic(:,:,3))));
% % 
% % %��ȥƽ��ֵ
% % secondpic = zeros(rows,cols,colors);%�õõ��Ĳ�������һ��ȫ��ľ���������������洢�Ҷ�ͼ��
% % secondpic = uint8(secondpic);%��������ȫ�����ת��Ϊuint8��ʽ����Ϊ���������䴴��֮��ͼ����double����
% % for i = 1:rows
% %     for j = 1:cols
% %         secondpic(i,j,1) = mypic(i,j,1)-redavg;
% %         secondpic(i,j,2) = mypic(i,j,2)-greenavg;
% %         secondpic(i,j,3) = mypic(i,j,3)-blueavg;
% %     end
% % end
% % 
% % %���ԶԱ���ϵ��,ȡֵ��Χ0-4
% % thirdpic = zeros(rows,cols,colors);%�õõ��Ĳ�������һ��ȫ��ľ���������������洢�Ҷ�ͼ��
% % thirdpic = uint8(thirdpic);%��������ȫ�����ת��Ϊuint8��ʽ����Ϊ���������䴴��֮��ͼ����double����
% % for i = 1:rows
% %     for j = 1:cols
% %         for k = 1:colors  
% %             thirdpic(i,j,k) =  secondpic(i,j,k)*2;
% %         end
% %     end
% % end
% % 
% % %+ƽ��ֵpicavg Ȼ���������ϵ�������ȡֵ��Χ[0-2]֮��
% % forthpic = zeros(rows,cols,colors);%�õõ��Ĳ�������һ��ȫ��ľ���������������洢�Ҷ�ͼ��
% % forthpic = uint8(forthpic);%��������ȫ�����ת��Ϊuint8��ʽ����Ϊ���������䴴��֮��ͼ����double����
% % for i = 1:rows
% %     for j = 1:cols
% %         forthpic(i,j,1) =  thirdpic(i,j,1)+ redavg*1;
% %         forthpic(i,j,2) =  thirdpic(i,j,2)+ greenavg*1;
% %         forthpic(i,j,3) =  thirdpic(i,j,3)+ blueavg*1;
% %     end
% % end
% % 
% % %�����ص�RGBֵ������ɸ�ֵ
% % endpic = zeros(rows,cols,colors);%�õõ��Ĳ�������һ��ȫ��ľ���������������洢�Ҷ�ͼ��
% % endpic = uint8(endpic);%��������ȫ�����ת��Ϊuint8��ʽ����Ϊ���������䴴��֮��ͼ����double����
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
% %ԭͼ
% subplot(131)
% imshow(mypic);
% title('ԭͼ')
% 
% %�Դ��㷨
% suanfapic = imadjust(mypic,[75/255,160/255],[0,1]);
% subplot(132)
% imshow(suanfapic);
% title('�Դ��㷨')
% 
% subplot(133)
% imshow(outpic);
% title('�ҵ��㷨')








