close all;
clear all;
clc;

R1 = 10*10^3     %%responsavel pela carga (tempo de high)
R2 = 10*10^3      %%responsavel pela carga (tempo de high) e descarga (tempo de low)
C = 100*10^-9      %%quant maior, menor a frequencia

%% Calc Freq e periodo sabendo as resistencias e a capacitancia

T1 = 0.693*(R1 + R2)*C %%time high (carga)
T2 = 0.693*R2*C        %%time low (descarga)


T = T1 + T2
F = 1/T
D = R2/(R1 + 2*R2)     %%time high

%% Calc de R2 sabendo a frequencia, capacitancia e R1
R1 = 10.4*10^3
F = 100
C = 100*10^-9

Rt = 1.44/(F * C)  %%Rt = R1 + 2*R2

R2 = Rt - R1
R2 = R2/2


T1 = 0.693*(R1 + R2)*C %%time high (carga)
T2 = 0.693*R2*C        %%time low (descarga)
%% plot 



