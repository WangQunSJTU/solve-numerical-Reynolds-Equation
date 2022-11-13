function [] = speedTest()
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


runTimes=10;
plusTimes=100;

p1=solve(A,B,C);
p0=zeros(l);
% for i=2:l-1
%     p0=p0*(0.95+0.1*rand());
% end
% plot(p1);
% hold on

tic 
for i=1:plusTimes*runTimes
    p1=solve(A,B,C);
end
toc;
time1=toc

time2=10000;
rateDelta=0.1;
p2=traditionalMethod (A,B,C,p0,2-rateDelta,1e-5,1);

for rate=rateDelta:rateDelta:2-rateDelta
tic 
for i=1:runTimes
    p2=traditionalMethod (A,B,C,p0,rate,1e-5,0);
end
toc
time2=min(time2,toc);
end
efficiency=time2/time1*plusTimes

end