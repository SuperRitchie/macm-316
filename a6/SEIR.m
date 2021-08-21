% 1
t = 180; 

N = 5 * 10^6;
alpha = 1/5;
R0 = 2.5;
gamma = 1/10;
beta = R0 * gamma;

S = zeros(t,1);
E = zeros(t, 1);
I = zeros(t,1);
R = zeros(t,1);

R(1) = 0;
I(1) = 40;
E(1) = 20*I(1);
S(1) = N-I(1)-E(1)-R(1);

for i = 2:t
    S(i) = S(i-1) - beta*I(i-1)*S(i-1)/N;
    E(i) = E(i-1) + beta*I(i-1)*S(i-1)/N - alpha*E(i-1);
    I(i) = I(i-1) + alpha*E(i-1) - gamma*I(i-1);
    R(i) = R(i-1) + gamma*I(i-1); 
end

figure(1)
plot(1:t,S,'LineWidth',2)
hold on
plot(1:t,E,'LineWidth',2)
hold on
plot(1:t,I,'LineWidth',2)
hold on
plot(1:t,R,'LineWidth',2)
grid on
hold off

title("SEIR")
legend("Susceptible", "Exposed", "Infected","Removed")
xlabel("Time (days)")
ylabel("Population")

incident = zeros(t,1);
incident(1) = 0;
for i = 2:t
    incident(i) = alpha*E(i - 1);
end

figure(2)
plot(1:t,incident,'LineWidth',2)
title("SEIR incident cases")
xlabel("Time (days)")
ylabel("Daily New Cases")
%%%%%%%%%%%%%%%%%%%%%%
% 2
R0 = zeros(t,1);
beta = zeros(t,1);

%% scenario 1
for i = 1:20
    R0(i) = 3.5;
    beta(i) = R0(i) * gamma;
end
for i = 21:70
    R0(i) = 2.6;
    beta(i) = R0(i) * gamma;
end
for i = 71:84
    R0(i) = 1.9;
    beta(i) = R0(i) * gamma;
end
for i = 85:90
    R0(i) = 1;
    beta(i) = R0(i) * gamma;
end
for i = 91:110
    R0(i) = 0.55;
    beta(i) = R0(i) * gamma;
end
for i = 111:180
    R0(i) = 0.55;
    beta(i) = R0(i) * gamma;
end
for i = 181:t
    R0(i) = 0.5;
    beta(i) = R0(i) * gamma;
end

S = zeros(t,1);
E = zeros(t, 1);
I = zeros(t,1);
R = zeros(t,1);

R(1) = 0;
I(1) = 40;
E(1) = 20*I(1);
S(1) = N-I(1)-E(1)-R(1);

for i = 2:t
    S(i) = S(i-1) - beta(i)*I(i-1)*S(i-1)/N;
    E(i) = E(i-1) + beta(i)*I(i-1)*S(i-1)/N - alpha*E(i-1);
    I(i) = I(i-1) + alpha*E(i-1) - gamma*I(i-1);
    R(i) = R(i-1) + gamma*I(i-1); 
end

figure(3)
plot(1:t,S,'LineWidth',2)
hold on
plot(1:t,E,'LineWidth',2)
hold on
plot(1:t,I,'LineWidth',2)
hold on
plot(1:t,R,'LineWidth',2)
grid on
hold off

title("SEIR scenario1")
legend("Susceptible", "Exposed", "Infected","Removed")
xlabel("Time (days)")
ylabel("Population")

incident = zeros(t,1);
incident(1) = 0;

for i = 2:t
    incident(i) = alpha*E(i - 1);
end

figure(7)
plot(1:t,incident,'LineWidth',2)
title("SEIR scenario1 incident cases")
xlabel("Time (days)")
ylabel("Daily New Cases")


%% scenario 2
for i = 1:20
    R0(i) = 3;
    beta(i) = R0(i) * gamma;
end
for i = 21:70
    R0(i) = 2.2;
    beta(i) = R0(i) * gamma;
end
for i = 71:84
    R0(i) = 0.7;
    beta(i) = R0(i) * gamma;
end
for i = 85:90
    R0(i) = 0.8;
    beta(i) = R0(i) * gamma;
end
for i = 91:110
    R0(i) = 1.00;
    beta(i) = R0(i) * gamma;
end
for i = 111:180
    R0(i) = 0.90;
    beta(i) = R0(i) * gamma;
end
for i = 181:t
    R0(i) = 0.5;
    beta(i) = R0(i) * gamma;
end

S = zeros(t,1);
E = zeros(t, 1);
I = zeros(t,1);
R = zeros(t,1);

R(1) = 0;
I(1) = 40;
E(1) = 20*I(1);
S(1) = N-I(1)-E(1)-R(1);

for i = 2:t
    S(i) = S(i-1) - beta(i)*I(i-1)*S(i-1)/N;
    E(i) = E(i-1) + beta(i)*I(i-1)*S(i-1)/N - alpha*E(i-1);
    I(i) = I(i-1) + alpha*E(i-1) - gamma*I(i-1);
    R(i) = R(i-1) + gamma*I(i-1); 
end

figure(4)
plot(1:t,S,'LineWidth',2)
hold on
plot(1:t,E,'LineWidth',2)
hold on
plot(1:t,I,'LineWidth',2)
hold on
plot(1:t,R,'LineWidth',2)
grid on
hold off

title("SEIR scenario2")
legend("Susceptible", "Exposed", "Infected","Removed")
xlabel("Time (days)")
ylabel("Population")

incident = zeros(t,1);
incident(1) = 0;

for i = 2:t
    incident(i) = alpha*E(i - 1);
end

figure(8)
plot(1:t,incident,'LineWidth',2)
title("SEIR scenario2 incident cases")
xlabel("Time (days)")
ylabel("Daily New Cases")

%%%% scenario 3
for i = 1:20
    R0(i) = 3;
    beta(i) = R0(i) * gamma;
end
for i = 21:70
    R0(i) = 2.2;
    beta(i) = R0(i) * gamma;
end
for i = 71:84
    R0(i) = 0.9;
    beta(i) = R0(i) * gamma;
end
for i = 85:90
    R0(i) = 2.5;
    beta(i) = R0(i) * gamma;
end
for i = 91:110
    R0(i) = 3.20;
    beta(i) = R0(i) * gamma;
end
for i = 111:180
    R0(i) = 0.85;
    beta(i) = R0(i) * gamma;
end
for i = 181:t
    R0(i) = 0.5;
    beta(i) = R0(i) * gamma;
end

S = zeros(t,1);
E = zeros(t, 1);
I = zeros(t,1);
R = zeros(t,1);

R(1) = 0;
I(1) = 40;
E(1) = 20*I(1);
S(1) = N-I(1)-E(1)-R(1);

for i = 2:t
    S(i) = S(i-1) - beta(i)*I(i-1)*S(i-1)/N;
    E(i) = E(i-1) + beta(i)*I(i-1)*S(i-1)/N - alpha*E(i-1);
    I(i) = I(i-1) + alpha*E(i-1) - gamma*I(i-1);
    R(i) = R(i-1) + gamma*I(i-1); 
end

figure(5)
plot(1:t,S,'LineWidth',2)
hold on
plot(1:t,E,'LineWidth',2)
hold on
plot(1:t,I,'LineWidth',2)
hold on
plot(1:t,R,'LineWidth',2)
grid on
hold off

title("SEIR scenario3")
legend("Susceptible", "Exposed", "Infected","Removed")
xlabel("Time (days)")
ylabel("Population")

incident = zeros(t,1);
incident(1) = 0;

for i = 2:t
    incident(i) = alpha*E(i - 1);
end

figure(9)
plot(1:t,incident,'LineWidth',2)
title("SEIR scenario3 incident cases")
xlabel("Time (days)")
ylabel("Daily New Cases")

%%%%%%%%%%
opts = delimitedTextImportOptions("NumVariables", 5);
opts.DataLines = [2, Inf];
opts.Delimiter = ",";
opts.VariableNames = ["Reported_Date", "HA", "Sex", "Age_Group", "Classification_Reported"];
opts.VariableTypes = ["datetime", "categorical", "categorical", "double", "categorical"];
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
opts = setvaropts(opts, ["HA", "Sex", "Classification_Reported"], "EmptyFieldRule", "auto");
opts = setvaropts(opts, "Reported_Date", "InputFormat", "yyyy-MM-dd");
opts = setvaropts(opts, "Age_Group", "TrimNonNumeric", true);
opts = setvaropts(opts, "Age_Group", "ThousandsSeparator", ",");
%% the below directory needs to be changed accordingly
BCCDCCOVID19DashboardCaseDetails = readtable("C:\Users\Ritchie\Desktop\macm 316\a5\BCCDC_COVID19_Dashboard_Case_Details.csv", opts);
clear opts

%%%%%%%%%%
% 3 a
table = groupcounts(BCCDCCOVID19DashboardCaseDetails,'Reported_Date');
day = table{:,1};
count = table{:,2};


figure(6)
plot(day, count, '.', 'MarkerSize', 8)
hold on
grid on

% 3b
t = 550;
R0 = zeros(t,1);
beta = zeros(t,1);
for i = 1:20
    R0(i) = 1;
    beta(i) = R0(i) * gamma;
end
for i = 21:70
    R0(i) = 0.9;
    beta(i) = R0(i) * gamma;
end
for i = 71:84
    R0(i) = 2;
    beta(i) = R0(i) * gamma;
end
for i = 85:90
    R0(i) = 1.7;
    beta(i) = R0(i) * gamma;
end
for i = 91:110
    R0(i) = 0.7;
    beta(i) = R0(i) * gamma;
end
for i = 111:180
    R0(i) = 1.5;
    beta(i) = R0(i) * gamma;
end
for i = 181:250
    R0(i) = 0.9;
    beta(i) = R0(i) * gamma;
end

for i = 251:270
    R0(i) = 1.2;
    beta(i) = R0(i) * gamma;
end
for i = 271:299
    R0(i) = 2;
    beta(i) = R0(i) * gamma;
end
for i = 300:310
    R0(i) = 1.5;
    beta(i) = R0(i) * gamma;
end
for i = 311:370
    R0(i) = 0.9;
    beta(i) = R0(i) * gamma;
end
for i = 371:400
    R0(i) = 1.05;
    beta(i) = R0(i) * gamma;
end
for i = 401:430
    R0(i) = 1.06;
    beta(i) = R0(i) * gamma;
end
for i = 431:460
    R0(i) = 1.35;
    beta(i) = R0(i) * gamma;
end
for i = 461:t
    R0(i) = 0.5;
    beta(i) = R0(i) * gamma;
end

S = zeros(t,1);
E = zeros(t, 1);
I = zeros(t,1);
R = zeros(t,1);

R(1) = 0;
I(1) = 20;
E(1) = 10*I(1);
S(1) = N-I(1)-E(1)-R(1);

for i = 2:t
    S(i) = S(i-1) - beta(i)*I(i-1)*S(i-1)/N;
    E(i) = E(i-1) + beta(i)*I(i-1)*S(i-1)/N - alpha*E(i-1);
    I(i) = I(i-1) + alpha*E(i-1) - gamma*I(i-1);
    R(i) = R(i-1) + gamma*I(i-1); 
end

% plot(1:t,S,'LineWidth',2)
% plot(1:t,E,'LineWidth',2)
% plot(1:t,I,'LineWidth',2)
% plot(1:t,R,'LineWidth',2)

incident = zeros(t,1);
incident(1) = 0;

for i = 2:t
    incident(i) = alpha*E(i - 1);
end


plot(1:t,incident,'LineWidth',2)
title("SEIR Incident cases in B.C. with time dependent factors")
legend("Data", "Parameters")
xlabel("Time (months)")
ylabel("Daily New Cases")
hold off