syms f(x)
f(x) = x^3 - 6*x^2 + 9*x - 3;
% q1 = 1:11;
% q2 = 1:11;
% q3 = 1:11;
% q4 = 1:11;
% 
% f1 = 1:11;
% f2 = 1:11;
% f3 = 1:11;
% f4 = 1:11;
% 
% % 1
a = 0;
b = 4;

for ii = 1:100
    m = round((a + b)/2, 12)
    q1(ii) = m;
    f1(ii) = f(m);
    if round(f(m), 12)> 0
        b = m;
    else
        a = m;
    end
end

% % 2
% syms g(x);
% g(x) = (5*x^3 + 5*x^5 + x^2 + x^4 - 1)/(6*x^2 + 6*x^4);
% x_0 = -0.5;
% x_n = x_0;
% 
% for ii = 1:11
%     x_n = round(g(x_n), 12);
%     q2(ii) = x_n;
%     f2(ii) = f(x_n);
% end
% 
% % 3 
% p_0 = -0.5;
% p_n = p_0;
% 
% Df = diff(f,x);
% 
% for ii = 1:11
%     p_n = round(p_n - f(p_n)/Df(p_n), 12);
%     q3(ii) = p_n;
%     f3(ii) = f(p_n);
% end
% 
% % 4
% 
% p4_n2 = -1.5;
% p4_n1 = -1.6;
% 
% for ii = 1:11
%     p4_n = round(p4_n1 - (f(p4_n1) * ((p4_n1 - p4_n2) / (f(p4_n1) - f(p4_n2)))), 12);
%     q4(ii) = p4_n;
%     f4(ii) = f(p4_n);
%     p4_n2 = round(p4_n1, 12);
%     p4_n1 = round(p4_n, 12);
% end
% 
% % 5
% format long
% Bisection = q1.';
% FPI = q2.';
% Newton = q3.';
% Secant = q4.';
% 
% B = f1.';
% F = f2.';
% N = f3.';
% S = f4.';
% 
% T = table(Bisection, FPI, Newton, Secant)
% fT = table(B, F, N, S)