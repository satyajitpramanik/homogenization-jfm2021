%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   figure 9
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear; clc; 
close all; 

Pe = 1;
phis = [0.70 0.80 0.90];
cc = pink(length(phis)+3);
ms = [0.14 0 -0.14]; 

fig1 = figure(1); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Css vs x for linear R
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for im = 1:length(ms)
    
    m = ms(im); 

    for iphi = 1:length(phis)

        phi = phis(iphi); 
        
        file = strcat(['Css_phi0o',num2str(phi*1E3),'_Pe',...
            num2str(Pe*1E+2),'_mR_',num2str(m*1E+1),'.txt']); 
        Css_data = importdata(file);
        x = Css_data.data(:,1);
        Css = Css_data.data(:,2);

        subplot(221)
        hold all; 
        if m > 0
            plot(x,Css,'-','Linewidth',1,'color',cc(iphi,:))
        elseif m == 0
            plot(x,Css,':','Linewidth',1,'color',cc(iphi,:))
        else
            plot(x,Css,'--','Linewidth',1,'color',cc(iphi,:))
        end

    end
    
end

ylim([0.3 1.0])
set(gca,'FontSize',10,'FontName','Times','LineWidth',0.5,'TickDir','in')
box on

xlim([0.0 1.0])
set(gca,'XTick',0.0:0.1:1.0)
set(gca,'XTickLabel',{'0','','0.2','','0.4','','0.6','','0.8','','1',})
set(gca,'YTick',0.2:0.1:1.0)
set(gca,'YTickLabel',{'0.2','','0.4','','0.6','','0.8','','1'})

set(gca,'XMinorTick','off');
set(gca,'YMinorTick','off');

yl = ylabel('$C^{(0)}$'); 
yl.Interpreter = 'latex'; 
yl.FontName = 'Times'; 
yl.FontSize = 10; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Cout vs phi for linear R
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for im = 1:length(ms)

    m = ms(im); 
    
    file = strcat(['Cout_Pe',num2str(Pe*1E+2),'_mR_',...
        num2str(m*1E+2),'.txt']); 
    Cout_data = importdata(file);
    phis = Cout_data.data(:,1);
	Cout = Cout_data.data(:,2);

    subplot(222)
    hold all 
    if m > 0
        plot(phis,Cout,'-k','Linewidth',1,'Markersize',6)
    elseif m < 0
        plot(phis,Cout,'--k','Linewidth',1,'Markersize',6)
    else
        plot(phis,Cout,':k','Linewidth',1,'Markersize',6)
    end
    plot(phis(1),Cout(1),'o', 'color','k','MarkerFaceColor','k',...
        'Markersize',3,'HandleVisibility','off'); 
    
end

set(gca,'FontSize',10,'FontName','Times','LineWidth',0.5,'TickDir','in')
box on

xlim([0.5 1.0])
set(gca,'XTick',0.5:0.05:1.0)
set(gca,'XTickLabel',{'0.5','','0.6','','0.7','','0.8','','0.9','','1'})
ylim([0.2 1.0])
set(gca,'YTick',0.2:0.1:1.0)
set(gca,'YTickLabel',{'0.2','','0.4','','0.6','','0.8','','1'})

set(gca,'XMinorTick','off');
set(gca,'YMinorTick','off');

yl = ylabel('$C^{(0)}_{\rm out}$'); 
yl.Interpreter = 'latex'; 
yl.FontName = 'Times'; 
yl.FontSize = 10; 

legend('$m_R>0$', '$m_R=0$', '$m_R<0$','Interpreter','latex',...
    'FontSize',8,'FontName','Times', 'location', 'NorthWest','box','off')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Pe = 1;
phis = [0.70 0.80 0.90];
cc = pink(length(phis)+3);
ms = fliplr([-1.8 0 1.8]); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Css vs x for linear a
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for im = 1:length(ms)
    
    m = ms(im);

    for iphi = 1:length(phis)

        phi = phis(iphi);
        
        file = strcat(['Css_phi0o',num2str(phi*1E3),'_Pe',...
            num2str(Pe*1E+2),'_ma_',num2str(m*1E+1),'.txt']);
        Css_data = importdata(file);
        x = Css_data.data(:,1);
        Css = Css_data.data(:,2);

        subplot(223)
        hold on; 
        if m > 0
            plot(x,Css,'-','Linewidth',1,'color',cc(iphi,:))
        elseif m == 0
            plot(x,Css,':','Linewidth',1,'color',cc(iphi,:))
        else
            plot(x,Css,'--','Linewidth',1,'color',cc(iphi,:))
        end

    end

end
set(gca,'FontSize',10,'FontName','Times','LineWidth',0.5,'TickDir','in')
box on

xlim([0.0 1.0])
set(gca,'XTick',0.0:0.1:1.0)
set(gca,'XTickLabel',{'0','','0.2','','0.4','','0.6','','0.8','','1'})
ylim([0.3 1.0])
set(gca,'YTick',0.2:0.1:1.0)
set(gca,'YTickLabel',{'0.2','','0.4','','0.6','','0.8','','1'})

set(gca,'XMinorTick','off');
set(gca,'YMinorTick','off');

xl = xlabel('$\hat{x}_1$'); 
xl.Interpreter = 'latex'; 
xl.FontName = 'Times'; 
xl.FontSize = 10; 

yl = ylabel('$C^{(0)}$'); 
yl.Interpreter = 'latex'; 
yl.FontName = 'Times'; 
yl.FontSize = 10; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   %   Cout vs phi for linear a
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for im = 1:length(ms)
    
    m = ms(im); 
    
    file = strcat(['Cout','_Pe',num2str(Pe*1E+2),'_ma_',...
        num2str(m*1E+1),'.txt']); 
    Cout_data = importdata(file);
    phis = Cout_data.data(:,1);
	Cout = Cout_data.data(:,2);
    
    subplot(224)
    hold all
    if m > 0
        plot(phis,Cout,'-k','Linewidth',1,'Markersize',6)
    elseif m < 0
        plot(phis,Cout,'--k','Linewidth',1,'Markersize',6)
    else
        plot(phis,Cout,':k','Linewidth',1,'Markersize',6)
    end
    plot(phis(1),Cout(1),'o','color','k','MarkerFaceColor','k',...
        'Markersize',3,'HandleVisibility','off') 
    
end

set(gca,'FontSize',10,'FontName','Times','LineWidth',0.5,'TickDir','in')
box on

legend('$m_a>0$', '$m_a=0$', '$m_a<0$','Interpreter','latex',...
    'FontSize',8,...
    'FontName','Times', 'location', 'NorthWest', 'box', 'off')

xlim([0.5 1.0])
set(gca,'XTick',0.5:0.05:1.0)
set(gca,'XTickLabel',{'0.5','','0.6','','0.7','','0.8','','0.9','','1'})
ylim([0.2 1.0])
set(gca,'YTick',0.2:0.1:1.0)
set(gca,'YTickLabel',{'0.2','','0.4','','0.6','','0.8','','1'})

set(gca,'XMinorTick','off');
set(gca,'YMinorTick','off');

xl = xlabel('$\phi$');
xl.Interpreter = 'latex'; 
xl.FontName = 'Times'; 
xl.FontSize = 10; 

yl = ylabel('$C^{(0)}_{\rm out}$'); 
yl.Interpreter = 'latex'; 
yl.FontName = 'Times'; 
yl.FontSize = 10; 

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
    [0.09 0.475 0.2 0.038],...
    'String',{'(c)'},...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',10,...
    'FontName','Times',...
    'FitBoxToText','on');

annotation('textbox',...
    [0.57 0.475 0.2 0.038],...
    'String',{'(d)'},...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',10,...
    'FontName','Times',...
    'FitBoxToText','on');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(fig1)

figw = 13.5; % cm
subfigw = 0.38; % Fraction of figw
subfigh = 0.36; % Fraction of figh
padleft = 1.3/figw; % Fraction of figw
padbottom = 1.4/figw; % Fraction of figw
padbetween = 1.4/figw; % Fraction of figw
figh = 0.9*figw; %(2*padbottom + 4*subfigh + 3*padbetween)*figw;

subplot(221)
set(gca,'Position',[padleft,padbottom+(subfigh+padbetween),...
    subfigw,subfigh])

subplot(222)
set(gca,'Position',[padleft+(subfigw+padbetween),...
    padbottom+(subfigh+padbetween),subfigw,subfigh])

subplot(223)
set(gca,'Position',[padleft,padbottom,subfigw,subfigh])

subplot(224)
set(gca,'Position',[padleft+(subfigw+padbetween),...
    padbottom,subfigw,subfigh])

set(gcf,'PaperUnits','centimeters')
set(gcf,'PaperSize',[figw figh])
set(gcf,'PaperPosition',[0 0 figw figh])
print(gcf,'-dpdf','./figure9.pdf'); 