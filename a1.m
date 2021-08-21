% 1
syms f(x)
f(x) = piecewise(0 <= x <= 0.5, 2*x, 0.5 < x <= 1, 2*x - 1);

figure(1)
fplot(@(x) 2*x,[0 0.5],'b');
hold on
fplot(@(x) 2*x - 1,[0.5 1],'b');
hold off
grid on
title('Piecewise function')
xlabel('x') 
ylabel('f(x)')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2
x0 = 0.200000000;

q2_i1 = f(x0)
q2_i2 = f(f(x0))
q2_i3 = f(f(f(x0)))


q2_i100 = x0;


q3 = 1:100;


for ii = 1:100
    q2_i100 = round(f(q2_i100), 12);
    
    q3(ii) = q2_i100;
end
q2_i100
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3
figure(2)
plot(q3, '.', 'MarkerSize', 8);
grid on
title(sprintf('The sequence with initial value x_0 = %.12f', x0))
xlabel('i') 
ylabel('(f^i)(x_0)') 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4
x0 = 1/pi;
temp = x0;
q4_1 = 1:100;
for ii = 1:100
    q4_1(ii) = round(f(temp), 12);
    temp = q4_1(ii);
end
figure(3)
plot(q4_1, '.', 'MarkerSize', 8);
grid on
title('The sequence with initial value x_0 = 1/\pi')
xlabel('i') 
ylabel('(f^i)(x_0)')


x0 = 0.2000000001;
temp = x0;
q4_2 = 1:100;
for ii = 1:100
    q4_2(ii) = round(f(temp), 12);
    temp = q4_2(ii);
end
figure(4)
plot(q4_2, '.', 'MarkerSize', 8);
grid on
title(sprintf('The sequence with initial value x_0 = %.12f', x0))
xlabel('i') 
ylabel('(f^i)(x_0)')