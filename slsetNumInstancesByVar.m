
%slsetNumInstancesByVar.m
%
%
%    author: steeve laquitaine
%   purpose: set the same number of instances by class by only keeping 
%            the minimum number of instances or by sampling
%            instances in larger classes without replacement.
%
%     usage:
%       
%       %find minimum number of instances
%       a = cell2mat(cellfun(@size,instances,'UniformOutput',false)');
%       minNumInst = min(a(:,1));
%       
%       %equalize
%       instances = slsetNumInstancesByVar(instances,variable,'balanceByRemovI')
%
%
%inputs :
%
%       instances : matrix of Nr rows (instances) x Nc columns (e.g., voxels)
%
%
%varargin :
%           'randomseed': if 'randomseed' if input make sure that a seed 
%           variable s.mat is present in the current directory.
%           This seed has been created with s = rng and saved.
%
%
%           'balanceByRemovI': case we balance by removing late instances       

function [instances,pos] = slsetNumInstancesByVar(instances,variable,varargin)

%Sort matrix instances into a structure for each variable level
instances = slmat2structByVar(instances,variable);

%case we balance by removing late instances
if any(strcmp(varargin,'balanceByRemovI'))==1

    fprintf('%s \n','(slsetNumInstancesByVar)','Balancing by removing the late instances')
    
    %find minimum number of instances
    a = cell2mat(cellfun(@size,instances,'UniformOutput',false)');
    minNumInst = min(a(:,1));
    
    %get num instances per classes
    for class = 1 : length(instances)
        instances{class} = instances{class}(1:minNumInst,:);
    end
    pos = 1 : minNumInst;
    return
end

%get random generator seed
if strcmp(varargin,'randomseed')
    load('s')
    rng(s)
end    

%case we sample instances without replacement
fprintf('%s \n','(slsetNumInstancesByClass)','Randomly sampling instances to balance dataset between conditions')
nClasses = length(instances);

%find minimum number of instances
a = cell2mat(cellfun(@size,instances,'UniformOutput',false)');
nInew = min(a(:,1));

%get # of instances
for i = 1 : nClasses
    ni(i) = size(instances{i},1);
end

%remove empty classes
ci = find(ni~=0);

%get num instances per classes
for i = 1 : length(ci)
    pos{i} = randperm(size(instances{ci(i)},1),numInstances);
    instances{ci(i)} = instances{ci(i)}(pos{i},:);
end

