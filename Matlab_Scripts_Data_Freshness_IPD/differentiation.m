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

%This script solves the simple differentiation of equation (14) w.r.t E[h]
%to generate equations (15) in the form of Q and (16) in the form of S.
%Taken from the paper "Data Freshness in Mixed-Memory
%Intermittently-Powered Systems" by James Scott Broadhead and Przemysław Pawełczak. 

syms f c1 c2 p h d p;                           %Set symbolic parameters
eqn = 2*f*(c1+(p)/(2*h))+c2+p+2*d*h == 0;       %Taken from equation (14) from paper
Q = diff(eqn,h)                                 %Differentiation of (14) to find (15)
S = solve(Q,h)                                  %Solve for h [in the paper E[h]] to produce (16)