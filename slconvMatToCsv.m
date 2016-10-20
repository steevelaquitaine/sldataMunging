
%slconvMat2Csv.m
%
% author : steeve laquitaine
% purpose: convert mat variable to csv
%   
%  usage : 
%
%   %matfile contains myvariable
%   matfile = load('FileName.mat');
%   slconvMat2Csv('mycsv',matfile.myvariable)

function  slconvMat2Csv(savedCSV,filename)

csvwrite('FileName.csv', FileData.M);