clc;clear;close all;
x = linspace(1.5,100,1000);
p = zeros(1,length(x));
data = readmatrix("zetazeros");
rho = data(:,2);
rho = .5 + 1i.*rho;
rhosum = sum(x.^rho);


for k = 1:1000
    rhosum(k) = sum(real(logint(x(k).^rho))./log(x(k)));
end

li = logint(x);
g = @(y) 1./(y.*((y.^2)-1).*log(y));


for k = 1:length(x)
    p(k)=length(primes(x(k)));
    f(k) = logint(x(k))-log(2)-integral(g,x(k),Inf);
    h(k) = f(k)-rhosum(k);
end


figure()
plot(x,p);
hold on
plot(x,li);
%plot(x,f);
plot(x,rhosum);
ylim([0 35])
legend("\pi(x)","li(x)")

figure()
plot(x,h)
hold on
xline(primes(100))