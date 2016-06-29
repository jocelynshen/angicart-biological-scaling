function arr = fillArr(method)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
datafile = 'ttt.txt';
A = importdata(datafile);
A = A.data;

arr = [];
for i = 1:length(A)
    if(~isnan(A(i,6)))
        if(method == 1)
            par  = A(i,6);
            idx_par = find(round(A(:,1))==par);
            rk1 = A(i,4);
            rk = A(idx_par,4);
            a = calcA(rk,rk1);
            if(abs(a) ~= Inf)
                arr = [arr a];
            end
       end
   end
   if(method == 3)
        if(~isnan(A(i,6)))
            a = A(i,4);
            if(abs(a) ~= Inf)
                arr = [arr a];
            end
        end
   end
end


end

