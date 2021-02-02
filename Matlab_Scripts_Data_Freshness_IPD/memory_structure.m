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

%This script generates Figure 3b (E[f] against Aoi for various memory structures)
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


P = 500;                %Total processing time
I = 200;                 %System idle time
R = 50;                  %R kinetic system
V = 10;                  %Restoration overhead 
D = 5;                  %Checkpoint overhead 
X = 201;                %Size of array needed
h=10;                   %h for Single k = 50 
H = zeros(1,X);         %Create zeros array to store E[f] values in
Q = zeros(1,X);         %Create zeros array to store AoI for mixed h = 10
N = zeros(1,X);         %Create zeros array to store AoI for mixed optimum
B = zeros(1,X);         %Create zeros array to store AoI for volatile
W = zeros(1,X);         %Create zeros array to store AoI for non-volatile

for f = 1:X
    fl=f-1
    mm = 2*fl*(R+V+(D+1)/(2)+(P)/(2*h))+I+2*D*h+2*P
    nvm = I+2*fl*R+2*P;
    vm = I+2*fl*(R+P/2+I)+2*P;
    H(f)=f-1;           %Populate H with values of E[f] from 0 to P
    Q(f) = mm;          %Populate Q with AoI for mixed-memory K=50
    B(f) = vm;          %Populate B with AoI for volatile 
    W(f) = nvm;         %Populate W with AoI for non-volatile
end

semilogy(H,Q,'color','[0 0.4470 0.7410]','LineWidth',1.25)
hold on
semilogy(H,W,'--','color','[0.4660 0.6740 0.1880]','LineWidth',1.25)
hold on
semilogy(H,B,'-.','color','[0.8500 0.3250 0.0980]','LineWidth',1.25)
hold on
grid on
xlabel({'Expected number of system failures E[f]'},'FontSize', 20,'FontName','Times')
ylabel('Average PAoI [clock ticks]','FontSize', 20,'FontName','Times')
legend('MM','NVM','VM','FontSize', 17,'FontName','Times','Location', 'NorthWest')
xlim([0 10])
set(gca,'FontName','Times','FontSize',17);
set(gcf,'position',[100,100,400,270])
box on
hold off
