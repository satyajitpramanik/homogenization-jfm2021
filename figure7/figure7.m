clear; clc; 
close all; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot F vs phi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fig1 = figure();

subfig1 = subplot(121);

Rs = linspace(1E-8,1/2,1000);

phis_Mo = 1 - pi.*Rs.^2; % Mo: a=1
Fs_Mo = 2*pi*Rs./phis_Mo; % Mo: a=1
plot(phis_Mo,Fs_Mo,'-k','Linewidth',1);
hold on

phis_min = 1 - pi*Rs/2; % Min: a=2*R
Fs_min = pi./phis_min; % Min: a=2*R
plot(phis_min,Fs_min,'-.k','Linewidth',1); 

Rs = [0.1:0.1:0.4 0.49];
cc = parula(length(Rs)+1);

for iR = 1:length(Rs)
    
    R = Rs(iR);
    
    as = logspace(log10(2*R),2,1000);
    phis = 1 - pi*(R^2)./as;
    Fs = 2*pi*R./(as.*phis);
    
    plot(phis,Fs,'-','Linewidth',1,'color',cc(iR,:));
    plot(phis(1),Fs(1),'o','color', cc(iR,:), 'MarkerFaceColor', ...
        cc(iR,:),'Markersize',3)
    
end

box on
set(gca,'yscale','log')
set(gca,'FontSize',10,'FontName','Times','LineWidth',1)
set(gca,'XMinorTick','off');
set(gca,'YMinorTick','off');

xlim([0.2,1])
set(gca,'XTick',0.2:0.1:1)
set(gca,'XTickLabel',{'0.2','','0.4','','0.6','','0.8','','1'})
xlabel('$\phi$','Interpreter','latex');

ylim([2e-2,2e1])
set(gca,'YTick',[2e-2 2e-1 2 2E1])
% set(gca,'YTickLabel',{'10^{-2}','','10^{0}','','10^{2}'})
ylabel('$F$','Interpreter','latex');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot F vs R
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subfig2 = subplot(122);

Rs = linspace(1E-8,1/2,1000);

phis_Mo = 1 - pi.*Rs.^2; % Mo: a=1
Fs_Mo = 2*pi*Rs./phis_Mo; % Mo: a=1
plot(Rs,Fs_Mo,'-k','Linewidth',1);
hold on

phis_min = 1 - pi*Rs/2; % Min: a=2*R
Fs_min = pi./phis_min; % Min: a=2*R
plot(Rs,Fs_min,'-.k','Linewidth',1);

phis = [0.65 0.70 0.80 0.90 0.95];
cc = pink(length(phis)+5);

for iphi = 1:length(phis)

    phi = phis(iphi);
    Rs = linspace(1E-8,1/2,1000);

    as = pi*(Rs.^2)/(1-phi);
    Fs = 2*pi*Rs./(as*phi);

    ikeep = as>(2*Rs);
    Rs = Rs(ikeep);
    Fs = Fs(ikeep);

    semilogy(Rs,Fs,'Linewidth',1,'Color',cc(iphi,:))
    hold all;
    plot(Rs(1),Fs(1),'o','color', cc(iphi,:), 'MarkerFaceColor', ...
        cc(iphi,:),'Markersize',3)

end

box on
set(gca,'yscale','log')
set(gca,'FontSize',10,'FontName','Times','LineWidth',1)
set(gca,'XMinorTick','off');
set(gca,'YMinorTick','off');

xlim([0,0.5])
set(gca,'XTick',[0.0:0.05:0.5])
set(gca,'XTickLabel',{'0','','0.1','','0.2','','0.3','','0.4','','0.5'})
xlabel('$R$','Interpreter','latex');

ylim([2e-2,2e1])
set(gca,'YTick',[2e-2 2e-1 2 2E1])
% set(gca,'YTickLabel',{'10^{-2}','','10^{0}','','10^{2}'})

set(subfig1,'linewidth',0.5)
set(subfig1,'layer','top')

set(subfig2,'linewidth',0.5)
set(subfig2,'layer','top')

annotation('textbox',...
    [0.1 0.87 0.2 0.038],...
    'String',{'(a)'},...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',10,...
    'FontName','Times',...
    'FitBoxToText','on');

annotation('textbox',...
    [0.57 0.87 0.2 0.038],...
    'String',{'(b)'},...
    'LineStyle','none',...
    'Interpreter','latex',...
    'FontSize',10,...
    'FontName','Times',...
    'FitBoxToText','on');

% Two figures in two columns
figw = 13.5; % cm
subfigw = 0.4; % Fraction of figw
subfigh = 0.75; % Fraction of figh
padleft = 1.4/figw; % Fraction of figw
padbottom = 2.5/figw; % Fraction of figw
padbetween = .75/figw; % Fraction of figw
figh = 6;

set(subfig1,'Position',[padleft,padbottom,subfigw,subfigh])
set(subfig2,'Position',[padleft+(subfigw+1.2*padbetween),padbottom,...
    subfigw,subfigh])

set(fig1,'PaperUnits','centimeters')
set(fig1,'PaperSize',[figw figh])
set(fig1,'PaperPosition',[0 0 figw figh])

print(fig1,'-dpdf','./figure7.pdf');