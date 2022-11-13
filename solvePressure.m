function [pressure] = solvePressure(i,j,x,m,n,c)
         p1=(n(i)*c(j)-n(j)*c(i))/(n(j)*m(i)-n(i)*m(j));
         p2=(m(i)*c(j)-m(j)*c(i))/(m(j)*n(i)-m(i)*n(j));
         pressure=m(x)*p1+n(x)*p2+c(x);
        return;
end