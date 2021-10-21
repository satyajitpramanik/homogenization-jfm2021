%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   figure 8
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear; clc; 
close all; 

fig1 = figure(1); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Fixed radius
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

R = 0.4000;
Pes = [0 1 5]; 
cc = fliplr(parula(length(Pes)+1)); 
ms = -0.3:0.3:0.3; 

for im = 1:length(ms)

    m = ms(im); 
    
    for iPe = 1:length(Pes)

        Pe = Pes(iPe); 

        file = strcat(['Css_R0o',num2str(R*1E4),'Pe',num2str(Pe*1E2),...
            '_m',num2str(m*1E1),'.txt']);
        Css_data = importdata(file);
        x = Css_data.data(:,1);
        Css = Css_data.data(:,2);

        subplot(223)
        hold all; 
        
        if m > 0
            plot(x,Css,'-','Linewidth',1,'color',cc(iPe,:))
        elseif m == 0
            plot(x,Css,':','Linewidth',1,'color',cc(iPe,:))
        else
            plot(x,Css,'--','Linewidth',1,'color',cc(iPe,:))
        end

    end

end
set(gca,'FontSize',10,'FontName','Times','LineWidth',0.5,'TickDir','in')
box on

xlim([0.0 1.0])
set(gca,'XTick',0.0:0.1:1.0)
set(gca,'XTickLabel',{'0','','0.2','','0.4','','0.6','','0.8','','1'})
ylim([0.4 1])
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

for im = 1:length(ms)

    m = ms(im); 
    
    file = strcat('Cout_R0o',num2str(R*1E4),'_m_',num2str(m*1E+1),'.txt');
	Cout_data = importdata(file);
    Pes = Cout_data.data(:,1);
    Cout = Cout_data.data(:,2);

    subplot(224)
    
    if m > 0
        semilogx(Pes,Cout,'-k','Linewidth',1)
    elseif m ==0 
        semilogx(Pes,Cout,':k','Linewidth',1)
    else
        semilogx(Pes,Cout,'--k','Linewidth',1)
    end
    hold all

end

set(gca,'FontSize',10,'FontName','Times','LineWidth',0.5,'TickDir','in')
box on

legend('$m_\phi>0$', '$m_\phi=0$', '$m_\phi<0$','Interpreter','latex',...
    'FontSize',8,...
    'FontName','Times', 'location', 'NorthWest', 'box', 'off')

ylim([0.4 1])
set(gca,'YTick',0.2:0.1:1.)
set(gca,'YTickLabel',{'0.2','','0.4','','0.6','','0.8','','1'})

set(gca,'XMinorTick','on');
set(gca,'YMinorTick','off');

xl = xlabel('$Pe$'); 
xl.Interpreter = 'latex'; 
xl.FontName = 'Times'; 
xl.FontSize = 10; 

yl = ylabel('$C_{\rm out}^{(0)}$'); 
yl.Interpreter = 'latex'; 
yl.FontName = 'Times'; 
yl.FontSize = 10;  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Fixed aspect ratio
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

a = 1;
Pes = [0 1 5]; 
cc = fliplr(parula(length(ms)+1)); 
ms = -0.3:0.3:0.3; 

for im = 1:length(ms)

    m = ms(im); 
    
    for iPe = 1:length(Pes)

        Pe = Pes(iPe); 

        file = strcat(['Css_a=',num2str(a),'Pe',num2str(Pe*1E+2),'m_',...
            num2str(m*1E+1),'.txt']);
        Css_data = importdata(file);
        x = Css_data.data(:,1);
        Css = Css_data.data(:,2);

        subplot(221)
        if m > 0
            plot(x,Css,'-','Linewidth',1,'color',cc(iPe,:))
        elseif m == 0
            plot(x,Css,':','Linewidth',1,'color',cc(iPe,:))
        else
            plot(x,Css,'--','Linewidth',1,'color',cc(iPe,:))
        end
        hold all; 

    end

end
set(gca,'FontSize',10,'FontName','Times','LineWidth',0.5,'TickDir','in')
box on

xlim([0.0 1.0])
set(gca,'XTick',0:0.1:1)
set(gca,'XTickLabel',{'0','','0.2','','0.4','','0.6','','0.8','','1',})
ylim([0.4 1.0])
set(gca,'YTick',0.2:0.1:1)
set(gca,'YTickLabel',{'0.2','','0.4','','0.6','','0.8','','1',})

set(gca,'XMinorTick','off');
set(gca,'YMinorTick','off');

yl = ylabel('$C^{(0)}$'); 
yl.Interpreter = 'latex'; 
yl.FontName = 'Times'; 
yl.FontSize = 10; 

for im = 1:length(ms)

    m = ms(im); 
    
    file = strcat(['Cout_a=',num2str(a),'m_',num2str(m*1E+1),'.txt']);
	Cout_data = importdata(file);
    Pes = Cout_data.data(:,1);
    Cout = Cout_data.data(:,2);

    subplot(222)
    if m > 0
        semilogx(Pes,Cout,'-k','Linewidth',1)
    elseif m ==0 
        semilogx(Pes,Cout,':k','Linewidth',1)
    else
        semilogx(Pes,Cout,'--k','Linewidth',1)
    end
    hold all

end

set(gca,'FontSize',10,'FontName','Times','LineWidth',0.5,'TickDir','in')
box on

legend('$m_\phi>0$', '$m_\phi=0$', '$m_\phi<0$','Interpreter','latex',...
    'FontSize',8,...
    'FontName','Times', 'location', 'NorthWest', 'box', 'off')

ylim([0.4 1])
set(gca,'YTick',0.2:0.1:1)
set(gca,'YTickLabel',{'0.2','','0.4','','0.6','','0.8','','1'})

set(gca,'XMinorTick','on');
set(gca,'YMinorTick','off');

yl = ylabel('$C_{\rm out}^{(0)}$'); 
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
print(gcf,'-dpdf','figure8.pdf'); 