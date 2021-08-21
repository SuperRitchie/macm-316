m = 10000;
x = linspace(-1,1,m);
y = 1./(1+30*x.^2);

n = 11;
ips = linspace(-1,1,n)';
f = 1./(1+30*ips.^2);

Eq = barycentric_form(ips,f,x);

figure
subplot(2,2,1)
plot(x,y)
hold on
plot(x,Eq)
grid on

n = 16;
ips = linspace(-1,1,n)';
f = 1./(1+30*ips.^2);

Eq = barycentric_form(ips,f,x);

subplot(2,2,2)
plot(x,y)
hold on
plot(x,Eq)
grid on

n = 26;
ips = linspace(-1,1,n)';
f = 1./(1+30*ips.^2);

Eq = barycentric_form(ips,f,x);

subplot(2,2,3)
plot(x,y)
hold on
plot(x,Eq)
grid on

n = 41;
ips = linspace(-1,1,n)';
f = 1./(1+30*ips.^2);

Eq = barycentric_form(ips,f,x);

subplot(2,2,4)
plot(x,y)
hold on
plot(x,Eq)
grid on





n = 11;
angles = linspace(0,pi,n)';
ips = cos(angles);
f = 1./(1+30*ips.^2);

Cheby = barycentric_form(ips,f,x);

figure
subplot(2,2,1)
plot(x,y)
hold on
plot(x,Cheby)
grid on

n = 16;
angles = linspace(0,pi,n)';
ips = cos(angles);
f = 1./(1+30*ips.^2);

Cheby = barycentric_form(ips,f,x);

subplot(2,2,2)
plot(x,y)
hold on
plot(x,Cheby)
grid on

n = 26;
angles = linspace(0,pi,n)';
ips = cos(angles);
f = 1./(1+30*ips.^2);

Cheby = barycentric_form(ips,f,x);

subplot(2,2,3)
plot(x,y)
hold on
plot(x,Cheby)
grid on

n = 41;
angles = linspace(0,pi,n)';
ips = cos(angles);
f = 1./(1+30*ips.^2);

Cheby = barycentric_form(ips,f,x);

subplot(2,2,4)
plot(x,y)
hold on
plot(x,Cheby)
grid on


n = 6;
ips = linspace(-1,1,n)';
f = 1./(1+30*ips.^2);
z = csape(ips,f,'second');
z = fnval(z,x);

figure
subplot(2,2,1)
plot(x,y)
hold on
plot(x,z)
grid on

n = 11;
ips = linspace(-1,1,n)';
f = 1./(1+30*ips.^2);
z = csape(ips,f,'second');
z = fnval(z,x);


subplot(2,2,2)
plot(x,y)
hold on
plot(x,z)
grid on


function p = barycentric_form(ips,f,x)

n = size(ips,1);
m = size(x,1);

w = ones(n,1);

for i = 1:n
    
    for k = 1:n
        
        if i ~= k
            w(i) = w(i)*(ips(i)-ips(k));
        end
        
    end
    
    w(i) = 1/w(i);
    
end

numer = zeros(m,1);
denom = zeros(m,1);

for i = 1:n
    
    numer = numer + f(i)*w(i)./(x-ips(i));
    denom = denom + w(i)./(x-ips(i));
    
end

p = numer./denom;

end
