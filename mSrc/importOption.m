function [ name, len, rad, parent, tips ] = importOption(software, datafile)
%getBinFreq: function that creates the bins and the frequency to plot the
%scaling exponents
%
%INPUT:
% arr: array containing the scaling exponents
%
%OUTPUT:
%  bins
%  frequency: frequency that each variable occurs
%
%EXAMPLES
% [bins, frequency] = getBinFreq(arr);
%
%HISTORY	
%	Jocie Shen, 6/23/16, first written
%============================================================
if(strcmp(software, 'C++'))
    A = importdata(datafile);
    A = A.data;
    col = size(A);
    col = col(2);
    name   = (A(1:length(A)-1,1));
    len    = (A(1:length(A)-1,3));
    rad    = (A(1:length(A)-1,5));
    parent = (A(1:length(A)-1,6));
    num_child = (A(1:length(A)-1,7));
    
    child_arr = linspace(8,col, col-7);
    maxchildren = length(child_arr);
    nchild = [];
    nvessels = length(name);
    vesselchildren = zeros(nvessels, maxchildren+1);
    vesselname = [];
    tips = [];
    for k = 1:nvessels
        nchild = [nchild num_child(k)];
    end
    for j = 1:nvessels
        thisname = name(j);
        vesselname = [vesselname thisname];
        parent(j) = 0;
        for j1 = 1:nvessels
            if j == j1
                continue
            end
            found = 0;
            for k = 1:nchild(j1)
                nmchild = A(j1, k + 7);   %indnch = 7 if file contains vessel coordinates, 13 otherwise
                if thisname == nmchild(1)
                    found = 1;
                    indexparent = j1;
                    break   
                end
            end
            if found == 1
                break
            end
        end
        if found == 1
            nfound = vesselchildren(indexparent, 1);
            vesselchildren(indexparent, 1) = nfound + 1;
            vesselchildren(indexparent, nfound + 2) = j;
            parent(j) = indexparent;
        end
    end
    k = 0;
    for m = 1:nvessels    %begin algorithm for finding tips
        if nchild(m) < 1          
            k = k + 1;
            tips = [tips m];             %tips becomes an array of vessels that are endpoints (have no children)
        end
    end
    p = size(tips);
    p = p(2);
    for m = 1:nvessels
        c = 1;
        for n = 1:p
            x = tips(n);
            while (parent(x) > 0)
                if parent(x) == m
                    c = c + 1;
                    break
                end
                x = parent(x);
            end 
        end
        tips(m) = c;
    end
    name   = num2cell(A(1:length(A)-1,1));
    len    = num2cell(A(1:length(A)-1,3));
    rad    = num2cell(A(1:length(A)-1,5));
    parent = num2cell(A(1:length(A)-1,6));
    tips = tips;
else
    dataPath=[datafile];
    [alldataStructure]=tdfread(dataPath, 'tab');
    name   = cellstr(alldataStructure.name);
    len    = num2cell(alldataStructure.len);
	rad    = num2cell(alldataStructure.rad);
	parent = cellstr(alldataStructure.parent);
    tips = num2cell(alldataStructure.tips);
end
end
