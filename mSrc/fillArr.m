function arr = fillArr(method, rl)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
datafile = 'ttt.txt';
A = importdata(datafile);
A = A.data;

arr = [];
for i = 1:length(A)
    if(~isnan(A(i,9)))
        if(method == 1)
            if(rl == 'r')
            par  = A(i,6);
            %par = angicartData.parent;
            idx_par = find(round(A(:,1))==par);
            %idx_par = find(angicartData.name==par);
            rk1 = A(i,4);
            rk = A(idx_par,4);
            a = calcA(rk,rk1);
            if(abs(a) ~= Inf)
                arr = [arr a];
            end
            end
            if(rl == 'l')
            par  = A(i,6);
            %par = angicartData.parent;
            idx_par = find(round(A(:,1))==par);
            %idx_par = find(angicartData.name==par);
            rk1 = A(i,3);
            %rk1 = A(i,2);
            rk = A(idx_par,3);
            %rk = A(idx_par, 2);
            a = calcA(rk,rk1);
            if(abs(a) ~= Inf)
                arr = [arr a];
            end
            end
       end
   end
   if(method == 3)
        if(~isnan(A(i,9)))
            if(rl == 'r')
            a = A(i,4);
            if(abs(a) ~= Inf)
                arr = [arr a];
            end
            end
            if(rl == 'l')
            a = A(i,3);
            %a = A(i,2);
            %a = angicartData.len;
            if(abs(a) ~= Inf)
                arr = [arr a];
            end
            end
        end
   end
end


end

