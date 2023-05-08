%RETO LAB ÓPTICA
close all;
clf;

setlatex()

%tener el .csv como "image_unwrapped (1).csv"
ex=readmatrix('image_unwrapped (1).csv');

%valor de la matriz: ex=1536x2645
ex(1,:)=[]; ex(:,1)=[]; ex=abs(ex);

ex=(ex./(2*pi))*((1.5314)/sin(0.3846));

%%%% ARRIBA

ex1=ex(1:311,:);  ex1(ex1 >15.85 & ex1 < 16.9)=12.34; ex(1:311,:)=ex1;

%%%% LADO BONITO

ex2=ex(310:1315,1:890);  ex2(ex2 >15.85 & ex2 < 16.9)=12.34; ex(310:1315,1:890)=ex2;
%---
ex22=ex(515:785,890:955); ex22(ex22 >15.85 & ex22 < 16.9)=12.34; ex(515:785,890:955)=ex22;
%---
ex23=ex(785:1039,890:973); ex23(ex23 >15.85 & ex23 < 16.9)=12.34; ex(785:1039,890:973)=ex23;
%---
ex24=ex(1039:1315,890:1050); ex24(ex24 >15.85 & ex24 < 16.9)=12.34; ex(1039:1315,890:1050)=ex24;

%%%%LADO FEO

ex3=ex(310:883,1592:2645);  ex3(ex3 >15.85 & ex3 < 17.2)=12.34; ex(310:883,1592:2645)=ex3;
%----
ex32=ex(883:1315,1592:2645); ex32(ex32 >15.85 & ex32 < 17.2)=12.34; ex(883:1315,1592:2645)=ex32;

%%%% ABAJO

ex4=ex(1306:1536,1:2645); ex4(ex4 >15.85 & ex4 < 16.9)=12.34; ex(1306:1536,1:2645)=ex4;
%----
ex42=ex(1106:1536,1:2645);  ex42(ex42 >16)=12.34; ex(1106:1536,1:2645)=ex42;

%%%

 %se filtran los picos extremos y se re-escala
 ex(ex >17.08  | ex < 12.34)=12.34;ex=ex-12.34; 
 ex= imgaussfilt3(ex,9);

%SE GRAFICA (todas las medidas están a proporción del vaso real)
%altura: 8.83 cm, largo de arriba: 9 cm, largo de abajo: 5.5 cm,
figure(1)
X=linspace(0,25.66,2645); Y=linspace(0,13.38,1536); 
s=surf(X,Y,ex); %xlim([0 25.66]); ylim([0 13.38]); zlim([0 10]) 
title ('Imagen tridimensional del objeto: vaso de caf\''e','Fontsize',14); s.EdgeColor = 'none';
xlabel('Posici\''on x [cm]','Fontsize',14); ylabel('Posici\''on y [cm]','Fontsize',14);
c = colorbar; c.Label.String = ' Elevación [cm]'; c.Label.FontSize=15;

%Cálculos de los errores: diámetro inferior del vaso
figure(2)
plot(X, ex(1305,:))
hold on
r=5.5/2;
f=sqrt(r.^2-(X-12.37).^2);
plot(X,f)
error=abs(f-ex(1300,:))/real(f);
E1=sum(error)*100
E1={'Error porcentual','promedio: 15.85 %'};
title('Error de la elevaci\''on del vaso en su parte inferior')
legend('Corte de la elevaci\''on del vaso (Parte inferior)','Valor ideal') 
xlabel('X [cm]'); ylabel('Elevación [cm]')
text(20,2,E1)
hold off

%Cálculos de los errores: diametro superior del vaso
figure(3)
plot(X, ex(335,:))
hold on
rr=9/2;
ff=sqrt(rr.^2-(X-12.37).^2);
plot(X,ff)
error2=abs(ff-ex(335,:))/real(ff);
E2=sum(error2)*100
E2={'Error porcentual','promedio: 11.14 %'};
%E2=['Error porcentual promedio:',num2str(E2),'%'];
title('Error de la elevaci\''on del vaso en su parte superior')
legend('Corte de la elevaci\''on del vaso (Parte superior)','Valor ideal') 
xlabel('X [cm]');ylabel('Elevaci\''on [cm]')
text(22,2,E2)

hold off


