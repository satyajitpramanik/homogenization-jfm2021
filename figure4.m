clear; clc; 
close all; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Figure 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Rs = [0.05 0.01:0.01:0.5]; 
y1 = 2*Rs;

Rs_obs = Rs(6:5:end); 
cc = parula(length(Rs_obs)+2); 

fig1 = figure(1); 
figure(fig1);
h1 = axes; 

height = 100;

amins = 2*linspace(0.005,0.5,2048);
phimins = 1-pi*amins/4;
amaxs = linspace(1,height,2048); 
phimaxs = 1-pi/4./amaxs; 

subplot(121)
semilogy(phimins,amins,'-.k','Linewidth',2); 
hold on 
patch('xdata', [1,phimins,phimaxs,1] , 'ydata', [amins(1), ...
    amins, amaxs, amaxs(end)], 'faceColor', [0.95 0.95 0.95], ...
    'EdgeColor', 'none');
semilogy([phimins(1) phimins(end)], [1,1],'-k', 'Linewidth',1)

for iR = 1:length(Rs_obs)
    
    R = Rs_obs(iR);
    as = linspace(2*R,height,2048); 
    phis = 1 - pi*R^2./as; 
    
    subplot(121)
    semilogy(phis,as,'-','Linewidth',1,'color',cc(iR,:)); 
  
     semilogy(phis(1),as(1),'o','color', cc(iR,:), 'MarkerFaceColor', ...
         cc(iR,:),'Markersize',3) 
   
end

phis_obs = [0.35, 0.45, 0.55, 0.65, 0.75, 0.85, 0.925];
phis_high = [0.975, 0.995, 0.999]; 
phis_obs = [phis_obs, phis_high];
cc = pink(length(phis_obs)+7);
Rsmin = linspace(1e-4,.5,100);
asmin = 2*Rsmin; 
amax = 1e3+zeros(1,100);
Rmax = flip(Rsmin); 
 ylim([1e-2 1e1])


subplot(122)
semilogy(Rsmin,asmin,'-.k','Linewidth',2); 
hold on 
patch('xdata', [Rsmin(1),Rsmin, Rmax, Rmax(end)] , 'ydata', ...
    [asmin(1),asmin,amax,amax(1)],'faceColor', [0.95 0.95 0.95], ...
    'EdgeColor', 'none');

hold on 

semilogy([Rsmin(1) Rsmin(end)], [1,1],'-k', 'Linewidth',1)

for iphi = 1:length(phis_obs)
    
    phi = phis_obs(iphi);
    Rs = linspace(2*(1-phi)/pi,1/2,200);
    as = pi*Rs.^2/(1-phi); 
    
    subplot(122)
    semilogy(Rs,as,'-','Linewidth',1,'color',cc(iphi,:)); 
	semilogy(Rs(1),as(1),'o','color', cc(iphi,:), 'MarkerFaceColor', ...
        cc(iphi,:),'Markersize',3) 
    
end

subplot(121)
set(gca,'FontSize',10,'FontName','Times', ... %'FontWeight', 'Bold',...
	'LineWidth',1,'TickDir','in')
set(gca,'XMinorTick','off')
set(gca,'YMinorTick','on')
box on
set(gca,'linewidth',0.5)
set(gca,'layer','top')
    
xl = xlabel('$\phi$');
xl.Interpreter = 'latex';
xl.FontSize = 10; 

yl = ylabel('$a$');
yl.Interpreter = 'latex'; 
yl.FontName = 'Times'; 
yl.FontSize = 10; 
set(gca,'XTick',0.2:0.1:1.0)
set(gca,'XTickLabel',{'0.2','','0.4','','0.6','','0.8','','1'})
ylim([1e-2 1e1])
xlim([0.2 1])

subplot(122)
set(gca,'FontSize',10,'FontName','Times', ... %'FontWeight', 'Bold',...
	'LineWidth',1,'TickDir','in')
set(gca,'XMinorTick','off')
set(gca,'YMinorTick','on')
box on
set(gca,'linewidth',0.5)
set(gca,'layer','top')
    
xl = xlabel('$R$');
xl.Interpreter = 'latex'; 
xl.FontSize = 10; 

set(gca,'XTick',0.0:0.05:0.5)
set(gca,'XTickLabel',{'0','','0.1','','0.2','','0.3','','0.4','','0.5'})

ylim([1e-2 1e1])
xlim([0,0.5])

annotation('textbox',...
    [0.09 0.92 0.2 0.038],...
    'String',{'(a)'},...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',10,...
    'FontName','Times',...
    'FitBoxToText','on');

annotation('textbox',...
    [0.565 0.92 0.2 0.038],...
    'String',{'(b)'},...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',10,...
    'FontName','Times',...
    'FitBoxToText','on');

outdir = './';

figure(fig1)

figw = 13.5; % cm. Width of JFM printable area
subfigw = 0.41; % Fraction of figw
subfigh = 0.79; % Fraction of figh
padleft = 0.09; % Fraction of figw
padbottom = 0.17; % Fraction of figw
padbetween = 0.07; % Fraction of figw
figh = figw/(2.25); %(2*padbottom + 4*subfigh + 3*padbetween)*figw;

subplot(121)
set(gca,'Position',[padleft,padbottom,subfigw,subfigh])

subplot(122)
set(gca,'Position',[padleft+(subfigw+padbetween),padbottom,...
    subfigw,subfigh])

set(gcf,'PaperUnits','centimeters')
set(gcf,'PaperSize',[figw figh])
set(gcf,'PaperPosition',[0 0 figw figh])

print(gcf,'-dpdf',strcat([outdir,'/as_vs_phis_LCA.pdf'])); 