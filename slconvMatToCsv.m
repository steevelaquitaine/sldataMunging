
%slconvMatToCsv.m
%
% author : steeve laquitaine
% purpose: convert mat variable to csv
%
%  usage :
%
%   %matfile contains myvariable
%   matfile = load('FileName.mat');
%   slconvMat2Csv('mycsv',myvariable,'cell')
%
%   or
%
%   slconvMat2Csv('mycsv',myvariable,'numeric')


function slconvMatToCsv(savedCSV,filename,vartype)

%case variable contains numeric
if strcmp(vartype,'numeric')
    csvwrite([savedCSV '.csv'], filename);    
end

%case variable contains cells
if strcmp(vartype,'cell')    
    %open .csv file and print each cell
    %content in a separate cell of the csv
    %table
    fid = fopen([savedCSV '.csv'],'w');
    format = repmat('%s,',1,length(filename)-1);
    fprintf(fid,[format '%s \n'],filename{1,:})
    fclose(fid)
end

fprintf('%s %s %s \n','Variable has been printed in ',savedCSV,'.csv file in local path')
ls