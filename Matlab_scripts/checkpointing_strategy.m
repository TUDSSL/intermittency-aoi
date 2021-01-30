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

%This script generates Figure 3c (E[f] against Aoi for single and dual hz)

P = 500;                %Total processing time
I = 200;                %System idle time
R = 50;                 %R kinetic system
V = 10;                 %Restoration overhead 
D =5;                   %Checkpoint overhead 
h=20;                   %h for Single k = 25 
ha=100;                 %h for Single k = 5
h1=20;                  %h alpha
h2=20;                  %h beta 
k1=20;                  %K alpha
k2=5;                   %K beta
X = 201;                %Size of array needed
H = zeros(1,X);         %Create zeros array to store E[f] values in
Q = zeros(1,X);         %Create zeros array to store AoI Single k = 25
B = zeros(1,X);         %Create zeros array to store AoI Single k = 5
W = zeros(1,X);         %Create zeros array to store AoI Dual k = 20, 5

for f = 1:X    
    fl=f-1;             %Set the number of fails  
    si = 2*fl*(R+V+(D+1)/(2)+(P)/(2*h))+I+2*D*(h)+2*P;                     %AoI Single k = 25
    st = 2*fl*(R+V+(D+1)/(2)+(P)/(2*ha))+I+2*D*(ha)+2*P;                   %AoI Single k = 5
    sp = 2*fl*(R+V+(D+1)/(2)+(k1.^2+k2.^2)/(2*(k1+k2)))+I+2*D*(h1+h2)+2*P; %AoI Dual k = 20, 5
    H(f)=f-1;           %Populate H with values of E[f] from 0 to P 
    Q(f) = si;          %Populate with values of AoI for Single k = 25   
    W(f) = st;          %Populate with values of AoI for Single k = 5
    B(f) = sp;          %Populate with values of AoI for Dual k = 20, 5  
end

figure
semilogy(H,Q,'color','[0 0.4470 0.7410]','LineWidth',1.25)             %Plot AoI k = 25
hold on;
semilogy(H,W,'--','color','[0.4660 0.6740 0.1880]','LineWidth',1.25)   %Plot AoI k = 10
hold on;
semilogy(H,B,'-.','color','[0.8500 0.3250 0.0980]','LineWidth',1.25)   %Plot AoI k = 15, 5
hold on;
grid on
xlabel('Expected number of system failures E[f]','FontSize',20,'FontName','Times')
ylabel('Average PAoI [clock ticks]','FontSize', 20,'FontName','Times')
legend('E[K_{i,n}] = 25','E[K_{i,n}] = 5','E[K_{i,\alpha}] = 5, E[K_{i,\beta}] = 20','FontName','Times','FontSize', 17,'Location', 'SouthEast')
xlim([0 100])
set(gca,'FontName','Times','FontSize',17);
set(gcf,'position',[100,100,400,270])
box on
hold off