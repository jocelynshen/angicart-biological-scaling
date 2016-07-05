function arr = fillArrAngicart(method, rl)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
dataPath=['C:\Project\Biomathematics\mSrc\angicartdata.txt']
[A]=tdfread(dataPath, 'tab');
name = struct('n', {A.name});
parent = struct('p', {A.parent});
rad = struct('r', {A.len});
len = struct('l', {A.rad});
arr = [];
for i = 1:length(parent.p)
    if(~strcmp(parent.p(i),'NA'))
        if(method == 1)
            if(rl == 'r')
            par  = A.parent(i)
            idx_par = find(strcmp(name.n(i),par));
            rk1 = rad.r(i);
            rk = rad.r(idx_par);
            a = calcA(rk,rk1);
            if(abs(a) ~= Inf)
                arr = [arr a];
            end
            end
            if(rl == 'l')
            par  = parent.p(i);
            idx_par = find(strcmp(name.n(i),par));
            rk1 = len.l(i);
            rk = len.l(idx_par);
            a = calcA(rk,rk1);
            if(abs(a) ~= Inf)
                arr = [arr a];
            end
            end
       end
   end
   if(method == 3)
        if(~isempty(parent.p(i)))
            if(rl == 'r')
            a = rad.r(i);
            if(abs(a) ~= Inf)
                arr = [arr a];
            end
            end
            if(rl == 'l')
            a = len.l(i);
            if(abs(a) ~= Inf)
                arr = [arr a];
            end
            end
        end
   end
end


end

