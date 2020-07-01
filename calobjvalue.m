%实现目标函数的计算
function [objvalue]=calobjvalue(pop,i)
global lengthN N min max code;          % 默认染色体的二进制长度length=10
% distance=0;
load A.mat;
% load pop.mat;
load shicechangqiang.mat

min=0.02;max=0.13;
GS=350;%射线条数
% X=X/100;


for j=1:N
    temp(:,j)=decodechrom(pop,1+(j-1)*lengthN,lengthN);%将pop每行(个体）每列（每段基因）转化成十进制数
    x(:,j)=temp(:,j)/(2^lengthN-1)*(max-min)+min;    % popsize×N 将二值域中的数转化为变量域的数   
%     distance=distance+(x(:,j)-code(i,j)).^2;                 % 将得popsize个不同的距离
end
X=x;

[M,N]=size(X);
Obj=zeros(M,1);
 C=zeros(M,GS);
  l=((shicechangqiang(:,1)-shicechangqiang(:,3)).^2+(shicechangqiang(:,2)-shicechangqiang(:,4)).^2).^0.5;%%射线长度
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
         %计算目标函数值：欧氏距离