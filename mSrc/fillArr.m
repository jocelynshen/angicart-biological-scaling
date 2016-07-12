function arr = fillArr(method, option, software, datafile)
%fillArr: uses C++ data and fills array with scaling exponents if method 1 is being
%used, radius and length if method 3 or compare is being used
%
%INPUT:
% method: determines which method to use to calculate scaling exponents
% option: radius or length
%
%EXAMPLES
% arr = fillArr(1, 'r');
%
%HISTORY	
%	Jocie Shen, 7/7/16, first written
%============================================================
[S.name, S.len, S.rad, S.parent] = importOption(software, datafile);
arr = [];
nData = length(S.name);

for irow = 1:nData
    if(~strcmp(S.parent(irow),'NA') & ~isnan(cell2mat(S.parent(irow))))
        if(method == 1)
            par  = S.parent(irow);
            if(strcmp(software, 'C++'))
                idx_par = find(round(cell2mat(S.name(:))) == cell2mat(par));
            else
            	idx_par = find(strcmp(S.name(:),par)==1);
            end
            if(option == 'r')
                rk1 = cell2mat(S.rad(irow));
                rk = cell2mat(S.rad(idx_par));
                a = calcA(rk,rk1);
                if(abs(a) ~= Inf)
                    arr = [arr a];
                end
            end
            if(option == 'l')
                rk1 = cell2mat(S.len(irow));
                rk = cell2mat(S.len(idx_par));
                a = calcA(rk,rk1);
                if(abs(a) ~= Inf)
                    arr = [arr a];
                end
            end
       end
    end
   if(method == 2)
   end
   if(method == 3)
        if(~strcmp(S.parent(irow),'NA') & ~isnan(cell2mat(S.parent(irow))))
            if(option == 'r')
                a = (cell2mat(S.rad(irow)));
                arr = [arr a];
            end
            if(option == 'l')
                a =(cell2mat(S.len(irow)));
                arr = [arr a];
            end
        end
   end
   
   if(method == 0 & strcmp(option,'r'))                    %used to plot frequency of radius to compare software
       arr = [arr cell2mat(S.rad(irow))];
   end
   if(method == 0 & strcmp(option,'l'))                    %used to plot frequency of length to compare software
       arr = [arr cell2mat(S.len(irow))];
   end
end
end

