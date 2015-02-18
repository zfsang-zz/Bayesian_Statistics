%question3.m
clear all
close all force

disp('NEURON INTERVALS CS')
  lw = 2; 
  set(0, 'DefaultAxesFontSize', 16);
  fs = 15;
  ms = 10;
% end of preabmle--------------------------------------
t=load('neuronint10.dat') ;
n=20

sumt = sum(t(1:20) ) %220
%
% gamma params, prior
alpha0 = 2; 
beta0 = 10;
%gamma params posterior
alpha1 = alpha0+sumt;
beta1 =  beta0+n;
bestim = alpha1/beta1     % 7.4000
bvar = alpha1/(beta1^2)  %0.2467
%
%!!!scale par
lb = gaminv(0.025, alpha1, 1/beta1)    % 6.4585
ub = gaminv(0.975, alpha1, 1/beta1)   %  8.4046
% size 1.2266
xx=8.5:0.01:11.5;
figure(1)
plot(xx, gampdf(xx, alpha1, 1/beta1),'k-','LineWidth',lw) 
hold on
 plot([bestim, bestim],[0,0],'o','MarkerSize',ms,'MarkerEdgeColor','b','MarkerFaceColor','r')
 plot([lb,lb],[0,0],'o','MarkerSize',ms,'MarkerEdgeColor','b','MarkerFaceColor','g')
 plot([ub,ub],[0,0],'o','MarkerSize',ms,'MarkerEdgeColor','b','MarkerFaceColor','g')
 plot(xx, gampdf(xx, alpha0, 1/beta0),'b:','LineWidth',lw)
hold off
print -depsc 'CSBay.eps'
 %% 
 
 cut=0.2
 format long
  lo= fzero(@(x) gampdf(x, alpha1, 1/beta1)-cut, 8)
 up= fzero(@(x) gampdf(x, alpha1, 1/beta1)-cut, 12)
% 95HPD=[        8.224778365197814,     8.224778365197814]
%  size 0
 format long
 gamcdf(lo, alpha1, 1/beta1) + (1- gamcdf(up, alpha1, 1/beta1))
   %1
 format short
 