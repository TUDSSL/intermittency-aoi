%MIT License

%Copyright (c) 2021 James Scott Broadhead [of the TU Delft Sustainable Systems
%Laboratory]

%Permission is hereby granted, free of charge, to any person obtaining a copy
%of this software and associated documentation files (the "Software"), to deal
%in the Software without restriction, including without limitation the rights
%to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
%copies of the Software, and to permit persons to whom the Software is
%furnished to do so, subject to the following conditions:

%The above copyright notice and this permission notice shall be included in all
%copies or substantial portions of the Software.

%THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
%IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
%FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
%AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
%LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
%OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
%SOFTWARE.

%This script generates Figure 3a (E[h] against Aoi for RF1 and RF2) 
%in the paper "Data Freshness in Mixed-Memory Intermittently-Powered Systems" 
%by James Scott Broadhead and Przemysław Pawełczak.

%To cite this publication please use the following BiBTeX entry.

%@misc{broadhead:intermittent-aoi:2021,
%  title = {Data Freshness in Mixed-Memory Intermittently-Powered Systems},
%  author = {James Scott {Broadhead} and Przemys\l{}aw {Pawe\l{}czak}},
%  year = {2021},
%  month = feb,
%  note = {submitted for publication}
%}


P = 500;        %Total processing time
I = 200;         %System idle time
R1 = 50;         %R RF1 system
R2 = 75;         %R RF2 system
V = 10;          %Restoration overhead 
D = 5;          %Checkpoint overhead 
f1 = 15;       %Failure rate of RF1 system
f2 = 6;        %Failure rate of RF2 system          
H = zeros(1,P); %Create zeros array to store E[h] values in 
Q = zeros(1,P); %Create zeros array to store Aoi RF1 values in 
W = zeros(1,P); %Create zeros array to store Aoi RF2 values in 

for i = 1:P
    KE = 2*f1*(R1+V+(D+1)/(2)+(P)/(2*i))+I+2*D*i+2*P;     %Equation for RF1 system AoI
    PV = 2*f2*(R2+V+(D+1)/(2)+(P)/(2*i))+I+2*D*i+2*P;     %Equation for RF2 system AoI
    H(i) = i;           %Populate H with values of E[h] from 1 to P 
    Q(i) = KE;          %Populate with values of AoI for RF1 system
    W(i) = PV;          %Populate with values of AoI for RF2 system   
end

idx = islocalmin(Q);    %Find minimum AoI for RF1 system
idb = islocalmin(W);    %Find minimum AoI for RF1 system
hold on
plot(H,Q,'color','[0 0.4470 0.7410]','LineWidth',1.25)              %Plot RF1 AoI
plot(H,W,'--','color','[0.4660 0.6740 0.1880]','LineWidth',1.25)    %Plot RF2 AoI
plot(H(idx),Q(idx),'xk', 'MarkerSize',10,'LineWidth',1)             %Plot RF1 min
plot(H(idb),W(idb),'xk', 'MarkerSize',10,'LineWidth',1)             %Plot RF2 min
xlabel({'Expected number of checkpoints E[h]'},'FontSize', 20,'FontName','Times')
ylabel('Average PAoI [clock ticks]','FontSize', 20,'FontName','Times')
legend('Average peak AoI [RF 1]','Average peak AoI [RF 2]','Minimum AoI values','FontName','Times','FontSize', 17,'Location', 'NorthEast')
xlim([0 100])
set(gca,'FontName','Times','FontSize',17);
set(gcf,'position',[100,100,400,270])
box on
hold off
fprintf('Peak min KE located at %0.2f\n',H(idx))     %Print RF1 min
fprintf('Peak min PV located at %0.2f\n',H(idb))     %Print RF2 min
