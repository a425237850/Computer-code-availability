function [newpop]=mutation(pop,pm)
global popsize N lengthN;
for i=1:popsize
   if(rand<pm) %����һ������������ʱȽ�
      mpoint=round(rand*N*lengthN);  % �������λ��
     if mpoint<=0
        mpoint=1;
     end
     newpop(i,:)=pop(i,:);
     if newpop(i,mpoint)==0
        newpop(i,mpoint)=1;
     else
        newpop(i,mpoint)=0;
     end
   else
     newpop(i,:)=pop(i,:);
   end
end