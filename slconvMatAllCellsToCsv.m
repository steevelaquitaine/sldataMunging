
%slconvMatAllCellsToCsv.m
%
%
% author : steeve laquitaine
% purpose: convert matlab cell matrix variable to a .csv file
%
%  usage :
%
%   %matfile should contains your variable "myvariable"
%   matfile = load('FileName.mat');
%   slconvMatAllCellsToCsv('mycsv',myvariable)


function slconvMatAllCellsToCsv(savedCSV,filename)

%open .csv file and print each cell
%content in a separate cell of the csv
%table
fid = fopen([savedCSV '.csv'],'w');
for i = 1 : size(filename,1)    
    format = repmat('%s,',1,size(filename,2)-1);
    fprintf(fid,[format '%s \n'],filename{i,:});    
end
fclose(fid)
fprintf('%s %s %s \n','Variable has been printed in ',savedCSV,'.csv file in local path')
ls