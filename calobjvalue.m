%ʵ��Ŀ�꺯���ļ���
function [objvalue]=calobjvalue(pop,i)
global lengthN N min max code;          % Ĭ��Ⱦɫ��Ķ����Ƴ���length=10
% distance=0;
load A.mat;
% load pop.mat;
load shicechangqiang.mat

min=0.02;max=0.13;
GS=350;%��������
% X=X/100;


for j=1:N
    temp(:,j)=decodechrom(pop,1+(j-1)*lengthN,lengthN);%��popÿ��(���壩ÿ�У�ÿ�λ���ת����ʮ������
    x(:,j)=temp(:,j)/(2^lengthN-1)*(max-min)+min;    % popsize��N ����ֵ���е���ת��Ϊ���������   
%     distance=distance+(x(:,j)-code(i,j)).^2;                 % ����popsize����ͬ�ľ���
end
X=x;

[M,N]=size(X);
Obj=zeros(M,1);
 C=zeros(M,GS);
  l=((shicechangqiang(:,1)-shicechangqiang(:,3)).^2+(shicechangqiang(:,2)-shicechangqiang(:,4)).^2).^0.5;%%���߳���
 for i=1:M
   for j=1:GS
     AA=A(j,:);
     B=AA(:)';
     C(i,j)=sum(B.*X(i,:)); 
   end
     D=(200-shicechangqiang(:,5)-20*log10(l)-8.69* C(i,:)');
 fitness=(sum(D.^2)/GS)^0.5;
 %Obj(i)=sum(abs(D),2)/GS;
 objvalue(i)=fitness;
 end
         %����Ŀ�꺯��ֵ��ŷ�Ͼ���