importfile('Data')
% 1. a)

A = E;
kappaOne = cond(A, 1);
q1aE = 1:100;
iteration = 0;

for j = 1:10
    b = B(:,j);
    for k = 1:10
        iteration = iteration + 1;
        d = D(:,k);    
        
        x = A\b;
        y = A\(b + epsilon*d);
        
        eValue = (norm((y - x), 1)) / (epsilon *(norm(x, 1)));
        q1aE(iteration) = eValue;
    end
end

average = mean(q1aE);
middle = median(q1aE);
maximum = max(q1aE);

figure(1)
plot(q1aE, '.', 'MarkerSize', 8);
set(gca, 'YScale', 'log');
yline(kappaOne, '-r', '\kappa_1');
title('Amplification plot with Matrix E using D')

str1 = sprintf('The average is %0.5f ', average);
str2 = sprintf('                      The median is %0.5f ', middle);
str3 = sprintf('The max is %0.5f ', maximum);
str4 = sprintf('The 1-condition number is %0.5f', kappaOne);
str = append(str1, str2, str3, str4);
dim = [0.45 0.55 0.3 0.3];
annotation('textbox', dim, 'String', str)


xlabel('System') 
ylabel('Amplification')
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A = H;
kappaOne = cond(A, 1);
q1aH = 1:100;
iteration = 0;

for j = 1:10
    b = B(:,j);
    for k = 1:10
        iteration = iteration + 1;
        d = D(:,k);    
        
        x = A\b;
        y = A\(b + epsilon*d);
        
        eValue = (norm((y - x), 1)) / (epsilon *(norm(x, 1)));
        q1aH(iteration) = eValue;
    end
end

average = mean(q1aH);
middle = median(q1aH);
maximum = max(q1aH);

figure(2)
plot(q1aH, '.', 'MarkerSize', 8);
set(gca, 'YScale', 'log');
yline(kappaOne, '-r', '\kappa_1');
title('Amplification plot with Matrix H using D')

str1 = sprintf('The average is %0.5f ', average);
str2 = sprintf('                      The median is %0.5f ', middle);
str3 = sprintf('The max is %0.5f ', maximum);
str4 = sprintf('The 1-condition number is %0.5f', kappaOne);
str = append(str1, str2, str3, str4);
dim = [0.45 0.55 0.3 0.3];
annotation('textbox', dim, 'String', str)

xlabel('System') 
ylabel('Amplification')

% 1. b)

A = E;
kappaOne = cond(A, 1);
q1bE = 1:60;
iteration = 0;

for j = 1:10
    b = B(:,j);
    for k = 1:6
        iteration = iteration + 1;
        C = BIGC(:,:,k);
        
        x = A\b;
        z = (A + epsilon*C)\b;
        
        eValue = norm(A, 1) * (norm(z - x, 1) / (epsilon * norm(x, 1)));
        q1bE(iteration) = eValue;
    end
end

average = mean(q1bE);
middle = median(q1bE);
maximum = max(q1bE);

figure(3)
plot(q1bE, '.', 'MarkerSize', 8);
set(gca, 'YScale', 'log');
yline(kappaOne, '-r', '\kappa_1');
yline(1/rcond(A), '-black', '1/rcond(A)');
title('Amplification plot with Matrix E using BIGC')

str1 = sprintf('The average is %0.5f ', average);
str2 = sprintf('                      The median is %0.5f ', middle);
str3 = sprintf('The max is %0.5f ', maximum);
str4 = sprintf('The 1-condition number is %0.5f', kappaOne);
str5 = sprintf('                         The 1/rcond(A) number is is %0.5f', 1/rcond(A));
str = append(str1, str2, str3, str4, str5);
dim = [0.45 0.11 0.35 0.35];
annotation('textbox', dim, 'String', str)


xlabel('System') 
ylabel('Amplification')

%%%%%%%%%%%%%%%%%%%%%%%%%%

A = H;
kappaOne = cond(A, 1);
q1bH = 1:60;
iteration = 0;

for j = 1:10
    b = B(:,j);
    for k = 1:6
        iteration = iteration + 1;
        C = BIGC(:,:,k);
        
        x = A\b;
        z = (A + epsilon*C)\b;
        
        eValue = norm(A, 1) * (norm(z - x, 1) / (epsilon * norm(x, 1)));
        q1bH(iteration) = eValue;
    end
end

average = mean(q1bH);
middle = median(q1bH);
maximum = max(q1bH);

figure(4)
plot(q1bH, '.', 'MarkerSize', 8);
set(gca, 'YScale', 'log');
yline(kappaOne, '-r', '\kappa_1');
yline(1/rcond(A), '-black', '1/rcond(A)');
title('Amplification plot with Matrix H using BIGC')

str1 = sprintf('The average is %0.5f ', average);
str2 = sprintf('                      The median is %0.5f ', middle);
str3 = sprintf('The max is %0.5f ', maximum);
str4 = sprintf('The 1-condition number is %0.5f', kappaOne);
str5 = sprintf('                         The 1/rcond(A) number is is %0.5f', 1/rcond(A));
str = append(str1, str2, str3, str4, str5);
dim = [0.43 0.6 0.35 0.35];
annotation('textbox', dim, 'String', str)


xlabel('System') 
ylabel('Amplification')


% 2. a)

A = E;
AINV = inv(A);
AC = inv(AINV);
I = eye(6);

q2a1 = norm(A * AINV - I, 1)
q2a2 = norm(AC - A, 1)

% 2. b)

A = H;
AINV = inv(A);
AC = inv(AINV);
I = eye(size(A));

q2b1 = norm(A * AINV - I, 1)
q2b2 = norm(AC - A, 1)
q2bExact = norm(AINV - HI, 1)

% 2. c)

A = H8;
AINV = inv(A);
AC = inv(AINV);
I = eye(size(A));

q2c1 = norm(A * AINV - I, 1)
q2c2 = norm(AC - A, 1)
q2cExact = norm(AINV - HI8, 1)
q2cKappaOne = cond(H8, 1)