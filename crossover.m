function newpop=crossover(pop,pc,k)
global N lengthN M popsize;
pc=pc-(M-k)/M*1/20;
% A=1:N*length;
 A=1:popsize;
% A=randcross(A,N,length); % ������A�Ĵ���������ң���ʵ�����������ԣ�
% for i=1:length
%     n1=A(i);n2=i+10; % ���ѡ�е�Ҫ���н������������Ⱦɫ��
%     for j=1:N                     % N�㣨�Σ�����
%            cpoint=length-round(length*pc);        % ������Ⱦɫ�������ѡ��Ľ����λ��
%            temp1=pop(n1,(j-1)*length+cpoint+1:j*length);temp2=pop(n2,(j-1)*length+cpoint+1:j*length);
%            pop(n1,(j-1)*length+cpoint+1:j*length)=temp2;pop(n2,(j-1)*length+cpoint+1:j*length)=temp1;
%     end      
%     newpop=pop;
% end

for i=1:lengthN
    B=A(randperm(length(A),2));
    n1=B(1,1);
   n2=B(1,2);
%     n1=A(i);n2=i+10; % ���ѡ�е�Ҫ���н������������Ⱦɫ��
    for j=1:N                     % N�㣨�Σ�����
           cpoint=lengthN-round(lengthN*pc);        % ������Ⱦɫ�������ѡ��Ľ����λ��
           temp1=pop(n1,(j-1)*lengthN+cpoint+1:j*lengthN);temp2=pop(n2,(j-1)*lengthN+cpoint+1:j*lengthN);
           pop(n1,(j-1)*lengthN+cpoint+1:j*lengthN)=temp2;pop(n2,(j-1)*lengthN+cpoint+1:j*lengthN)=temp1;
    end      
    newpop=pop;
end
   