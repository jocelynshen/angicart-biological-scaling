function arr = fillArr(method, option)
%fillArr: uses C++ data and fills array with scaling exponents if method 1 is being
%used, radius and length if method 3 or compare is being used
%
%INPUT:
% method: determines which method to use to calculate scaling exponents
%         1) Conservation-based
%         2) Ratio-based
%         3) Distribution-based
%         4) Regression-based
% option: radius or length
%
%EXAMPLES
% arr = fillArr(1, 'r');
%
%HISTORY	
%	Jocie Shen, 7/7/16, first written
%============================================================
software = 'angicart';
arr = [];
N = 0;
for index = 1:18
    if(index ~= 13 & index ~= 15 & index ~= 6)
        datafile = strcat('patient',int2str(index),'.txt');
    [S.name, S.len, S.rad, S.parent, S.tips] = importOption(software, datafile);
nData = length(S.name)-1;
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
                if(rk1 < rk)
                    a = calcA(rk,rk1);
                    if(abs(a) ~= Inf)
                        arr = [arr a];
                    end
                end
            end
            if(option == 'l')
                rk1 = cell2mat(S.len(irow));
                rk = cell2mat(S.len(idx_par));
                if(rk1 < rk)
                    a = calcA(rk,rk1);
                    if(abs(a) ~= Inf)
                        arr = [arr a];
                    end
                end
            end
        end
    end
    if(method == 2)
        if(~strcmp(S.parent(irow),'NA') & ~isnan(cell2mat(S.parent(irow))))
           par  = S.parent(irow);
            if(strcmp(software, 'C++'))
                idx_par = find(round(cell2mat(S.name(:))) == cell2mat(par));
            else
            	idx_par = find(strcmp(S.name(:),par)==1);
            end
            if(option == 'r')
                rk1 = cell2mat(S.rad(irow));
                rk = cell2mat(S.rad(idx_par));
                a = rk1/rk;
                if(abs(a) ~= Inf & ~isnan(a))
                    arr = [arr a];
                    N = N + 1;
                end
            end
            if(option == 'l')
                rk1 = cell2mat(S.len(irow));
                rk = cell2mat(S.len(idx_par));
                a = rk1/rk;
                if(abs(a) ~= Inf & ~isnan(a))
                    arr = [arr a];
                    N = N + 1;
                end
            end
        end
    end
   if(method == 3)
        if(~strcmp(S.parent(irow),'NA') & ~isnan(cell2mat(S.parent(irow))))
            if(option == 'r')
                a = (cell2mat(S.rad(irow)));
                if(a ~= 0)
                    arr = [arr a];
                end
            end
            if(option == 'l')
                a =(cell2mat(S.len(irow)));
                if(a ~= 0)
                    arr = [arr a];
                end
            end
        end
   end
   if(method == 4)
       if(~strcmp(S.parent(irow),'NA') & ~isnan(cell2mat(S.parent(irow))))
            if(option == 'r')
                a = log(cell2mat(S.rad(irow)));
                arr = [arr a];
                if(strcmp(software, 'C++'))
                    a = log(S.tips(irow));
                end
                if(strcmp(software, 'angicart'))
                    a = log(cell2mat(S.tips(irow)));
                end
                arr = [arr a];
                N = N + 1;
            end
            if(option == 'l')
                a = log(cell2mat(S.len(irow)));
                arr = [arr a];
                if(strcmp(software, 'C++'))
                    a = log(S.tips(irow));
                end
                if(strcmp(software, 'angicart'))
                    a = log(cell2mat(S.tips(irow)));
                end
                arr = [arr a];
                N = N+1;
            end
        end
   end
end
    end
end
end

