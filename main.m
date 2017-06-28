clear all
clc 
close all

 t = [-3:0.01:3];
N=ones(size(t));

    y1 = (exp(-((t).*(t))));
    y2 = (exp(-abs(t)));
    a(1)=-3;
    b(1)=3;
    k=(sqrt(5)-1)/2; 
    punkt1=b - ( b - a )*k;
    punkt2= (a + ( b - a )*k)*k;
    punkt3=a + ( b - a )*k;
    eps=0.01;
    iteracja=0;
    
    while((b-a)>eps)  
        iteracja=iteracja+1;
    %     pkt1 =exp(-((punkt1)*(punkt1)));
    %     pkt2 =exp(-((punkt2)*(punkt2)));
    %     pkt3=exp(-((punkt3)*(punkt3)));
    %     
        pkt1=exp(-abs(punkt1)); 
        pkt2=exp(-abs(punkt2)); 
        pkt3=exp(-abs(punkt3)); 

    %     pkt1 =(exp(-((punkt1)*(punkt1)))) + N(iteracja);
    %     pkt2 =(exp(-((punkt2)*(punkt2)))) + N(iteracja);
    %     pkt3=(exp(-((punkt3)*(punkt3)))) + N(iteracja);

%         pkt1=exp(-abs(punkt1)) + N(iteracja);
%         pkt2=exp(-abs(punkt2)) + N(iteracja);
%         pkt3=exp(-abs(punkt3)) + N(iteracja);

        pkt1_all(iteracja,1)=punkt1;   pkt2_all(iteracja,1)=punkt2;    pkt3_all(iteracja,1)=punkt3;
        pkt1_all(iteracja,2)=pkt1;   pkt2_all(iteracja,2)=pkt2;    pkt3_all(iteracja,2)=pkt3;
         if (pkt3 >pkt1) && (pkt3>pkt2 ) 
             a=punkt2;
            punkt1=punkt3;
            punkt3=a + ( b - a)*k;
            punkt2= (punkt3-punkt1)*0.5+punkt1;
         elseif  (pkt2>pkt1) && (pkt2>pkt3) 
             a=punkt1;
             b=punkt3;
            punkt1=punkt1;
            punkt3=a + ( b - a )*k;
          punkt2=(punkt3-punkt1)*0.5+punkt1;
         else 
            b=punkt2;
            punkt3=punkt1;
            punkt1=b - ( b - a )*k;
            punkt2=(punkt3-punkt1)*0.5+punkt1;
         end
    end
    wynik=(a+b)/2;
    iteracja;

figure()
plot(t,y2)
hold on
plot(pkt1_all(:,1),pkt1_all(:,2),'r*',pkt2_all(:,1),pkt2_all(:,2),'go',pkt3_all(:,1),pkt3_all(:,2),'k+')
hold off

