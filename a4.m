% 1 a

n = 50;
a = -1;
b = 1;

B = a + (b-a).*rand(n, n);

% 1 b
[Q, ~] = qr(B);

% 1 c
epsilon = 10^(-8);
Q1 = B;

for ii = 1:100
    B = a + (b-a).*rand(n, n);
    [Q, ~] = qr(B);
    Q1(:, :, ii) = Q;
end

% 2 a)


v = 1:n - 1;
k = 1;
for ii = 1:n - 1
    v(ii) = 1;
end

J = diag(v, k);

% 2 b
A = 4*J;
condA = cond(A)
eigA = eig(A)

q2b = A;
figure(1)
for ii = 1:100
    eigenvalues = eig(A + epsilon*Q1(:, :, ii));
    plot(eigenvalues, '.')
    hold on
end
title('Eigenvalues of (A + \epsilonQ_i) with A = 4J')
hold off

% 2 c
A = 4*J + 4*J^2;
eigA = eig(A)
condA = cond(A)
figure(2)
for ii = 1:100
    eigenvalues = eig(A + epsilon*Q1(:, :, ii));
    plot(eigenvalues, '.')
    hold on
end
title('Eigenvalues of (A + \epsilonQ_i) with A = 4J + 4J^2')
hold off;

% 3 a


v = 1:n - 1;
for ii = 1:n - 1
    v(ii) = 1;
end
diag1 = diag(v, 1);
diag2 = diag(v, -1);
for ii = 1:n
    v(ii) = -2;
end
diag3 = diag(v);

S = diag1 + diag2 + diag3;
L = diag2 + diag3;
U = J;

% 3 b
A = L\U;
condA = cond(A)
figure(3)
eigenvalues = eig(A);
plot(eigenvalues, '.')
title('Eigenvalues of A with A = L^-^1U')

% 3 c
figure(4)
for ii = 1:100
    eigenvalues = eig(A + epsilon*Q1(:, :, ii));
    plot(eigenvalues, '.')
    hold on
end
title('Eigenvalues of (A + \epsilonQ_i) with A = L^-^1U')
hold off;

% 4 a 

a = -2;
b = 2;
r = linspace(a, b, n);
p = poly(r);

% 4 b
A = compan(p);

% 4 c
eigCompanion = eig(A)
condA = cond(A);
figure(5)
for ii = 1:100
    eigenvalues = eig(A + epsilon*Q1(:, :, ii));
    plot(eigenvalues, '.')
    hold on
end
title('Eigenvalues of (A + \epsilonQ_i) with A = compan(poly(r))')
hold off

% 4 d
M = 2*rand(n) - 1;
[W,R] = qr(M); 
B = W*diag(r)*W';

eigenvalues1 = eig(B)

eigenvalues2 = 1:50;
eigenvalues3 = 1:50;

eigenvalues2 = eigenvalues2(:);
eigenvalues3 = eigenvalues3(:);

format long
for ii = 1:10
    eigenvalues2(:, :, ii) = eig(B + epsilon*Q1(:, :, ii));
    eigenvalues3(:, :, ii) = eig(B + epsilon*(Q1(:, :, ii) + Q1(:, :, ii)'));
end
eigenvalues2
eigenvalues3