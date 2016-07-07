function arr = fillArrAngicart(method, option)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
dataPath=['C:\Project\Biomathematics\mSrc\angicartdata.txt']
[alldataStructure]=tdfread(dataPath, 'tab');
alldata = [
           {'name','len','rad','parent'};
           [cellstr(alldataStructure.name), num2cell(alldataStructure.len),num2cell(alldataStructure.rad),cellstr(alldataStructure.parent)]
           ]; 
			
S.name   = cellstr(alldataStructure.name);
S.len    = num2cell(alldataStructure.len);
S.rad    = num2cell(alldataStructure.rad);
S.parent = cellstr(alldataStructure.parent);
nData = length(S.name);
arr = [];
for irow = 1:nData
    if(~strcmp(S.parent(irow),'NA'))
        if(method == 1)
            if(option == 'r')
                par  = S.parent(irow);    
                idx_par = find(strcmp(S.name(:),par)==1);
                rk1 = cell2mat(S.rad(irow));
                rk = cell2mat(S.rad(idx_par));
                a = calcA(rk,rk1);
                if(abs(a) ~= Inf)
                    arr = [arr a];
                end
            end
            if(option == 'l')
                par  = S.parent(irow);    
                idx_par = find(strcmp(S.name(:),par)==1);
                rk1 = cell2mat(S.len(irow));
                rk = cell2mat(S.len(idx_par));
                a = calcA(rk,rk1);
                if(abs(a) ~= Inf)
                    arr = [arr a];
                end
            end
       end
   end
   if(method == 3)
        if(~strcmp(S.parent(irow),'NA'))
            if(option == 'r')
                a = cell2mat(S.rad(irow));
                arr = [arr a];
            end
            if(option == 'l')
                a = cell2mat(S.len(irow));
                arr = [arr a];
            end
        end
   end
end
end
