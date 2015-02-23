%A = xlsread('transrescaled.xls');

F=0;
F1=1;
step=0;
centre=A(randsample(1:7,3),:);
while((abs(F-F1)>0.00000001)&&(step<1000))
    m1 = [];
    m2 = [];
    m3 = [];
    F1=F;
    F=0;
   for i=1:7
        d1=sum((A(i,:)-centre(1,:)).^2);
        d2=sum((A(i,:)-centre(2,:)).^2);
        d3=sum((A(i,:)-centre(3,:)).^2);
        if ((d1<d2)&&(d1<d3))
                m1=[m1;A(i,:)];
          elseif ((d2<d3)&&(d2<d1))
                m2=[m2;A(i,:)];
          elseif ((d3<d1)&&(d3<d2))
                m3=[m3;A(i,:)];
        end
    end
    for j=1:62
            centre(1,j)=mean(m1(:,j));
            centre(2,j)=mean(m2(:,j));
            centre(3,j)=mean(m3(:,j));
    end
    for k1=1:size(m1,1)
        F=F+sum((m1(k1,:)-centre(1,:)).^2);
    end
    for k2=1:size(m2,1)
        F=F+sum((m2(k2,:)-centre(2,:)).^2);
    end
    for k3=1:size(m3,1)
        F=F+sum((m3(k3,:)-centre(3,:)).^2);
    end
    step=step+1;
    F1-F;
    
end


disp('cluster 1 :');
for k1=1:size(m1,1)
        disp(m1(k1,1));
end
disp('cluster 2 :');
for k2=1:size(m2,1)
        disp(m2(k2,1));
end
disp('cluster 3 :');
for k3=1:size(m3,1)
        disp(m3(k3,1));
end














