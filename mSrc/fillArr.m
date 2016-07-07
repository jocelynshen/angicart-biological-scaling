function arr = fillArr(method, option)
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
datafile = 'ttt.txt';
A = importdata(datafile);
A = A.data;

arr = [];
for ind = 1:length(A)
    if(~isnan(A(ind,9)))
        if(method == 1)
            if(option == 'r')
                par  = A(ind,6);                           %column 6 contains the parent ID's
                idx_par = find(round(A(:,1))==par);        
                rk1 = A(ind,4);                            %column 4 contains the radius values
                rk = A(idx_par,4);
                a = calcA(rk,rk1);
                if(abs(a) ~= Inf)
                    arr = [arr a];
                end
            end
            if(option == 'l')
                par  = A(ind,6);
                idx_par = find(round(A(:,1))==par);
                rk1 = A(ind,3);
                rk = A(idx_par,3);
                a = calcA(rk,rk1);
                if(abs(a) ~= Inf)
                    arr = [arr a];
                end
            end
       end
   end
   if(method == 3)
        if(~isnan(A(ind,9)))
            if(option == 'r')
                a = A(ind,4);
                a = log(a);
                if(abs(a) ~= Inf)
                    arr = [arr a];
                end
            end
            if(option == 'l')
                a = A(ind,3);
                a = log(a);
                if(abs(a) ~= Inf)
                    arr = [arr a];
                end
            end
        end
   end
   if(method == 0 & strcmp(option,'r'))                    %used to plot frequency of radius to compare software
       arr = [arr A(ind,4)];
   end
   if(method == 0 & strcmp(option,'l'))                    %used to plot frequency of length to compare software
       arr = [arr A(ind,3)];
   end
end


end

