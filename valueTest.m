function [] = valueTest()
l=1000;
A=zeros(l,1);
B=zeros(l,1);
C=zeros(l,1);
p0=zeros(l,1);
for i=2:l-1
A(i) = 1 +0.2*rand();
B(i) = 1 +0.2*rand();
C(i) = -75+min(abs(i-350),abs(i-650));
end
p1=solve(A,B,C);
plot(p1);
hold on
p2=traditionalMethod (A,B,C,p0,1.8,1e-5,1);
end