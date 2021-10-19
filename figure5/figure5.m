clear; clc; 
close all; 
format long

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   figure 5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fig1 = figure(1); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   K vs phi for fixed R
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

K_Mo = importdata('K_Mo_fixed_R.txt');
phis_Mo = K_Mo.data(:,1);
K11s_Mo = K_Mo.data(:,2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plots K11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(321)
semilogy(phis_Mo,K11s_Mo,'-k','Linewidth',1); 
hold all
box on

K11_min = importdata('K11_envelope_fixed_R.txt');
phis_min = K11_min.data(:,1);
K11s_min = K11_min.data(:,2);

semilogy(phis_min,K11s_min,'-.k','Linewidth',1); 

Rs_colour = [0.1:0.1:0.4 0.49]; 
cc = parula(length(Rs_colour)+1); 

for index = 1:length(Rs_colour)
    
    R = Rs_colour(index); 

    file = strcat(['K11_R0o',num2str(R*1E2),'.txt']); 
    K11 = importdata(file);
    phis = K11.data(:,1);
    K11s = K11.data(:,2);
    
    semilogy(phis,K11s,'-','Linewidth',1,'color',cc(index,:)); 
    semilogy(phis(1),K11s(1),'o','color', cc(index,:), ...
        'MarkerFaceColor', cc(index,:),'Markersize',3) 

end

semilogy(1,1/12,'kd','MarkerFaceColor','black',...
    'MarkerSize',5)

ylim([1e-6, 1e+0])
xlim([0.2, 1e+0])

set(gca,'FontSize',10,'FontName','Times',... %'FontWeight','Bold',...
        'LineWidth',1,'TickDir','in')
set(gca,'XMinorTick','off');
set(gca,'YMinorTick','off');
set(gca,'YTick',[1e-6 1e-5 1e-4 1e-3 1e-2 1e-1 1])
set(gca,'YTickLabel',{'10^{-6}','','10^{-4}','','10^{-2}','','10^0'})

yl = ylabel('$K_{11}$');
yl.Interpreter = 'latex'; 
yl.FontSize = 10;
set(gca,'XTick',0.2:0.1:1)
set(gca,'XTickLabel',{'0.2','','0.4','','0.6','','0.8','','1'})

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plots K22
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(323)
semilogy([phis_Mo(end) phis_Mo(end)],[K11s_Mo(end) 1e-4],'-',...
    'Linewidth',1,'Color', 'r')%[.7 .7 .7])
hold all; 
semilogy(phis_Mo,K11s_Mo,'-k','Linewidth',1);

for index = 1:length(Rs_colour)
    
	R = Rs_colour(index); 
    file = strcat(['K22_R0o',num2str(R*1E2),'.txt']); 
    K22 = importdata(file);
    phis = K22.data(:,1);
    K22s = K22.data(:,2);
    
	semilogy([phis(1) phis(1)],[K22s(1) 1e-4],'-','Linewidth',1,...
        'Color', 'r')
	hold all
    semilogy(phis,K22s,'-','Linewidth',1,'color',cc(index,:)); 
   
end

K22_min = importdata('K22_envelope.txt');
phis_min = K22_min.data(:,1);
K22s_min = K22_min.data(:,2);

semilogy(phis_min,K22s_min,'-.k','Linewidth',1);
ylim([1e-8 1e+2])

set(gca,'YTick',[1e-9 1e-8 1e-7 1e-6 1e-5 1e-4 1e-3 1e-2 1e-1 1 1e1 ...
    1e2 1e3])

set(gca,'YTickLabel',{'', '10^{-8}','', '','','10^{-4}','','','',...
    '10^0','',''})

set(gca,'FontSize',10,'FontName','Times',...% 'FontWeight','Bold',...
        'LineWidth',1,'TickDir','in')
set(gca,'XMinorTick','off');
set(gca,'YMinorTick','off');

yl = ylabel('$K_{22}$');
yl.Interpreter = 'latex'; 
yl.FontSize = 10; 
set(gca,'XTick',0.2:0.1:1)
set(gca,'XTickLabel',{'0.2','','0.4','','0.6','','0.8','','1'}) 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plots K22/K11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for index = 1:length(Rs_colour)
    
    R = Rs_colour(index); 
    
    file = strcat(['K11_R0o',num2str(R*1E2),'.txt']); 
    K11 = importdata(file);
    phis1 = K11.data(:,1);
    K11s = K11.data(:,2);
    
    file = strcat(['K22_R0o',num2str(R*1E2),'.txt']); 
    K22 = importdata(file);
    phis2 = K22.data(:,1);
    K22s = K22.data(:,2);
    
	subplot(325)
	semilogy(phis_Mo,K11s_Mo./K11s_Mo,'-k','Linewidth',1);
	hold on
	semilogy([phis2(1) phis2(1)],[K22s(1)/K11s(1) 1e-2],'-',...
        'Linewidth',1,'Color', 'r')
    semilogy(phis2,K22s./interp1(phis1,K11s,phis2, 'pchip'),'-',...
        'Linewidth',1,'color',cc(index,:)); 
    
    set(gca,'Yscale','log');

end

subplot(325)
set(gca,'FontSize',10,'FontName','Times','LineWidth',1,'TickDir','in')

xl = xlabel('$\phi$');
xl.Interpreter = 'latex'; 
xl.FontSize = 10; 

yl = ylabel('$K_{22}/K_{11}$');
yl.Interpreter = 'latex'; 
yl.FontSize = 10; 
set(gca,'XTick',0.2:0.1:1)
set(gca,'XTickLabel',{'0.2','','0.4','','0.6','','0.8','','1'})

set(gca,'YTick',[1e-4 1e-3 1e-2 1e-1 1 1e1 1e2 1e3 1e4 1e5 1e6 1e7])
set(gca,'YTickLabel',{'','10^{-3}','','',...
    '10^0','','','10^3','','','10^6',''})

set(gca,'FontSize',10,'FontName','Times',...% 'FontWeight','Bold',...
        'LineWidth',1,'TickDir','in')
set(gca,'XMinorTick','off');
set(gca,'YMinorTick','off');
ylim([1e-4 1e7]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   K vs R for fixed phi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

file = 'K11_Mo_fixed_phi.txt'; 
K11_Mo_fixed_phi = importdata(file);
Rs = K11_Mo_fixed_phi.data(:,1);
K11s_Mo = K11_Mo_fixed_phi.data(:,2);

figure(fig1); 
subplot(322)
semilogy(Rs, K11s_Mo, '-k', 'Linewidth', 1); 
hold all
plot(0,1/12,'kd','MarkerFaceColor','black','MarkerSize',5)

subplot(324)
semilogy([Rs(end) Rs(end)],[K11s_Mo(end) 1e-4],'-','Linewidth',1,...
    'Color', 'r')%[.7 .7 .7])
hold all
semilogy(Rs, K11s_Mo, '-k', 'Linewidth', 1); 

subplot(326)
semilogy(Rs, K11s_Mo./K11s_Mo, '-k', 'Linewidth', 1); 
hold on
set(gca,'FontSize',10,'FontName','Times','LineWidth',1,'TickDir','in')

file = 'K11_envelope_fixed_phi.txt'; 
K11_envelope_fixed_phi = importdata(file);
Rs_min = K11_envelope_fixed_phi.data(:,1);
K11s_min = K11_envelope_fixed_phi.data(:,2);

subplot(322)
semilogy(Rs_min(2:end),K11s_min(2:end),'-.k','Linewidth',1); 
set(gca,'FontSize',10,'FontName','Times','LineWidth',1,'TickDir','in')

phis = [0.65 0.70 0.80 0.90 0.95];
cc = pink(length(phis)+5);

for iphi = 1:length(phis)

	phi = phis(iphi);

    file = strcat(['K11_phi0o',num2str(phi*1E2),'.txt']); 
    K11s = importdata(file);
    R = K11s.data(:,1);
    K11 = K11s.data(:,2);

    subplot(322)
    hold on
    semilogy(R,K11,'Linewidth',1,'Color',cc(iphi,:))
    hold all; 
    semilogy(R(1),K11(1),'o','color', cc(iphi,:), 'MarkerFaceColor', ...
        cc(iphi,:),'Markersize',3)
    
    file = strcat(['K22_phi0o',num2str(phi*1E2),'.txt']); 
    K22s = importdata(file);
    R = K22s.data(:,1);
    K22 = K22s.data(:,2);
    
    subplot(324)
    hold on
    semilogy([R(1) R(1)],[K22(1) 1e-4],'-','Linewidth',1,'Color', 'r')
	hold all
    semilogy(R,K22,'Linewidth',1,'Color',cc(iphi,:))
   
    subplot(326)
    semilogy([R(1) R(1)],[K22(1)/K11(1) 1e-2],'-','Linewidth',1,...
        'Color', 'r')
    hold on
    semilogy(R,K22./K11,'-','Linewidth',1,'color',cc(iphi,:)); 
 
    xlim([0 0.5])
    ylim([1e-7 1e7])
    
end

subplot(322)
xlim([0.0 0.5])
set(gca,'XTick',0.0:0.05:0.5)
set(gca,'XTickLabel',{'0','','0.1','','0.2','','0.3','','0.4','','0.5'})
ylim([1E-6 1])
set(gca,'XMinorTick','off');
set(gca,'YMinorTick','off');

set(gca,'YTick',[1e-6 1e-5 1e-4 1e-3 1e-2 1e-1 1])
set(gca,'YTickLabel',{'10^{-6}','','10^{-4}','','10^{-2}','','10^0'})

yl.FontName = 'Times'; 
yl.FontSize = 10; 
yl.Interpreter = 'latex'; 

subplot(324)
set(gca,'FontSize',10,'FontName','Times','LineWidth',1,'TickDir','in')

xlim([0.0 0.5])
set(gca,'XTick',0.0:0.05:0.5)
set(gca,'XTickLabel',{'0','','0.1','','0.2','','0.3','','0.4','','0.5'})
ylim([1e-8, 1e2])

set(gca,'YTick',[1e-9 1e-8 1e-7 1e-6 1e-5 1e-4 1e-3 1e-2 1e-1 1 1e1 ...
    1e2 1e3])
set(gca,'YTickLabel',{'', '10^{-8}','', '','','10^{-4}','','','',...
    '10^0','',''})

set(gca,'FontSize',10,'FontName','Times',...% 'FontWeight','Bold',...
        'LineWidth',1,'TickDir','in')
set(gca,'XMinorTick','off');
set(gca,'YMinorTick','off');

xl.FontName = 'Times'; 
xl.FontSize = 10; 
xl.Interpreter = 'latex'; 

subplot(326)
set(gca,'FontSize',10,'FontName','Times','LineWidth',1,'TickDir','in')

xl = xlabel('$R$');
xl.Interpreter = 'latex'; 
xl.FontSize = 10; 

yl.FontSize = 10; 
xlim([0.0 0.5])
ylim([1e-4 1e7]);
set(gca,'XTick',0.0:0.05:0.5)
set(gca,'XTickLabel',{'0','','0.1','','0.2','','0.3','','0.4','','0.5'})
set(gca,'YTick',[ 1e-4 1e-3 1e-2 1e-1 1 1e1 1e2 1e3 1e4 1e5 1e6 1e7])
set(gca,'YTickLabel',{'', '10^{-3}','', '','10^0','','','10^3','',''...
    ,'10^6',''})
set(gca,'XMinorTick','off');
set(gca,'YMinorTick','off');

subplot(321)
box on
set(gca,'linewidth',0.5)
set(gca,'layer','top')

subplot(322)
box on
set(gca,'linewidth',0.5)
set(gca,'layer','top')

subplot(323)
box on
set(gca,'linewidth',0.5)
set(gca,'layer','top')

subplot(324)
box on
set(gca,'linewidth',0.5)
set(gca,'layer','top')

subplot(325)
box on
set(gca,'linewidth',0.5)
set(gca,'layer','top')
set(gca,'YTick',[ 1e-4 1e-3 1e-2 1e-1 1 1e1 1e2 1e3 1e4 1e5 1e6 1e7])
set(gca,'YTickLabel',{'', '10^{-3}','', '','10^0','','','10^3','','',...
    '10^6',''})

subplot(326)
box on
set(gca,'linewidth',0.5)
set(gca,'layer','top')

annotation('textbox',...
    [0.09 0.945 0.2 0.038],...
    'String',{'(a)'},...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',10,...
    'FontName','Times',...
    'FitBoxToText','on');

annotation('textbox',...
    [0.57 0.945 0.2 0.038],...
    'String',{'(b)'},...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',10,...
    'FontName','Times',...
    'FitBoxToText','on');

 annotation('textbox',...
    [0.09 0.625 0.2 0.038],...
    'String',{'(c)'},...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',10,...
    'FontName','Times',...
    'FitBoxToText','on');
annotation('textbox',...
    [0.57 0.625 0.2 0.038],...
    'String',{'(d)'},...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',10,...
    'FontName','Times',...
    'FitBoxToText','on');
annotation('textbox',...
    [0.09 0.305 0.2 0.038],...
    'String',{'(e)'},...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',10,...
    'FontName','Times',...
    'FitBoxToText','on');
 annotation('textbox',...
    [0.57 0.305 0.2 0.038],...
    'String',{'(f)'},...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',10,...
    'FontName','Times',...
    'FitBoxToText','on'); 

figure(fig1)
% Six figures in three columns
figw = 13.5; % cm
subfigw = 0.41; % Fraction of figw
subfigh = 0.265; % Fraction of figh
padleft = 1.3/figw; % Fraction of figw
padbottom = 1/figw; % Fraction of figw
padbetween = .75/figw; % Fraction of figw
figh = figw; %(2*padbottom + 4*subfigh + 3*padbetween)*figw;

subplot(3,2,1)
set(gca,'Position',[padleft,padbottom+2*(subfigh+padbetween),...
    subfigw,subfigh])
subplot(3,2,2)
set(gca,'Position',[padleft+(subfigw+1.2*padbetween),...
    padbottom+2*(subfigh+padbetween),subfigw,subfigh])

subplot(3,2,3)
set(gca,'Position',[padleft,padbottom+(subfigh+padbetween),...
    subfigw,subfigh])
subplot(3,2,4)
set(gca,'Position',[padleft+(subfigw+1.2*padbetween),...
    padbottom+(subfigh+padbetween),subfigw,subfigh])

subplot(3,2,5)
set(gca,'Position',[padleft,padbottom,subfigw,subfigh])
subplot(3,2,6)
set(gca,'Position',[padleft+(subfigw+1.2*padbetween),padbottom,...
    subfigw,subfigh])

set(gcf,'PaperUnits','centimeters')
set(gcf,'PaperSize',[figw figh])
set(gcf,'PaperPosition',[0 0 figw figh])

set(gcf,'PaperUnits','centimeters')
set(gcf,'PaperSize',[figw figh])
set(gcf,'PaperPosition',[0 0 figw figh])
 
print(gcf,'-dpdf','./figure5.pdf'); 