% tmp tester file for plotbif.m
clear; clc; close all
pth = 'C:\Users\swamy\Documents\amy\thesis\logistic map\bifurcation_data\3.14.15_2\';
% pth = 'C:\Users\swamy\Documents\amy\thesis\logistic map\bifurcation_data\';
fname = 'rlog_bif_3_14_15_L0.11112.csv';
% fname = 'rlog_bif_3_15_15_L0.1.csv';
L = 0.11112;
rlen = 900/2;
x0len = 1000/10;
maxp = 52%256;
plotbif(pth,fname, L, rlen, x0len, maxp)