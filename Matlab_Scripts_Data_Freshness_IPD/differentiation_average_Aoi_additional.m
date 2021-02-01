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

%This script solves the differentiation of equation (19) w.r.t E[h]
%Taken from the paper "Data Freshness in Mixed-Memory
%Intermittently-Powered Systems" by James Scott Broadhead and Przemysław Pawełczak. 
%This result is not directly taken from the paper but is shown here for
%completeness. 
%To cite this publication please use the following BiBTeX entry.
%@misc{broadhead:intermittent-aoi:2021,
%  title = {Data Freshness in Mixed-Memory Intermittently-Powered Systems},
%  author = {James Scott {Broadhead} and Przemys\l{}aw {Pawe\l{}czak}},
%  year = {2021},
%  month = feb,
%  note = {submitted for publication}
%}

syms vary c3 c4 h D I;                                              %Set symbolic parameters
eqn = (vary)/(2*c3+(c4)/(h)+2*D*h)-I+(3/2)*(c3+(c4)/(2*h)+D*h)== 0; %Taken from equation (19) from paper
T = diff(eqn,h)                                                     %Differentiation of (19)
A = solve(T,h)         
fprintf('Hence the tractable solution (2^(1/2)*(D*c4)^(1/2))/(2*D) is the same value as equation (16)')
