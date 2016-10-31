




function [dataCells_bal,ixKeep,v_u] = slbalanceDataForVar(dataCells,variable)

%get unique variable values
v_u = unique(cell2mat(variable(:)));

%get data instances for this var value
%find min common number of instances
for i = 1 : length(v_u)        
    for j = 1 : length(variable)                
        v_u_ix{i,j} = find(variable{j}==v_u(i));
        v_u_nb{i,j} = length(v_u_ix{i,j});                
    end
end

%keep the first data instances for all cells
%of the dataset
dataCells_bal = dataCells;
for j = 1 : length(variable)
    for i = 1 : length(v_u)    
        %keep first data instances
        ix = find(variable{j}==v_u(i));        
        mNb = min(cell2mat(v_u_nb(i,:)));
        ixRemv = setdiff(ix,ix(1:mNb));
        ixKeep{i,j} = ix(1:mNb);
        dataCells_bal{j}(ix,:) = NaN;        
    end
    dataCells_bal{j}(isnan(dataCells_bal{j}(:,1)),:)=[];
end







