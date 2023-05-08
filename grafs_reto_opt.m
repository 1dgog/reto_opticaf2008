env_con = readmatrix('fase_envuelta_con.csv');
env_sin = readmatrix('fase_envuelta_sin.csv');
env_res = readmatrix('fase_envuelta_resta.csv');
%%
des_con = readmatrix('fase_des_con.csv');
des_sin = readmatrix('fase_des_sin.csv');
des_res = readmatrix('fase_des_resta.csv');
%%
close all
setlatex()
fig = figure
subplot(2,3,1)
surf(env_con); shading interp; view(2)
set(gca,'Ydir','reverse')
ylim([0 1536]);
xlim([1 2645]);
xlabel('(a)');
axis square
title('Fase envuelta con objeto')
subplot(2,3,2)
surf(env_sin); shading interp; view(2)
set(gca,'Ydir','reverse')
ylim([0 1536]);
xlim([1 2645]);
xlabel('(b)');
axis square
title('Fase envuelta sin objeto')
subplot(2,3,3)
surf(env_res); shading interp; view(2)
set(gca,'Ydir','reverse')
ylim([0 1536]);
xlim([1 2645]);
xlabel('(c)');
axis square
title('Resta de fase envuelta')
subplot(2,3,4)
surf(des_con); shading interp; view(2)
set(gca,'Ydir','reverse')
ylim([0 1536]);
xlim([1 2645]);
xlabel('(d)');
axis square
title('Fase desenvuelta con objeto')
subplot(2,3,5)
surf(des_sin); shading interp; view(2)
set(gca,'Ydir','reverse')
ylim([0 1536]);
xlim([1 2645]);
xlabel('(e)');
axis square
title('Fase desenvuelta sin objeto')
subplot(2,3,6)
surf(des_res); shading interp; view(2)
set(gca,'Ydir','reverse')
ylim([0 1536]);
xlim([1 2645]);
xlabel('(f)');
axis square
title('Resta de fase desenvuelta')

han=axes(fig,'visible','off');
han.XLabel.Visible='on';
han.YLabel.Visible='on';

ylabel(han,'Y [Pixeles]');
xlabel(han,'X [Pixeles]');
