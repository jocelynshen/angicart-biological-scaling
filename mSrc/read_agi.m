%function S = read_agi(fname)

%if nargin<1, fname = 'angicartdata.txt';end
fname = 'angicartdata.txt'
fid=fopen(fname,'r');

% -- open the file 
l = fgetl(fid);

% we first read the head line and use it to determine # of columns in data
% - -define the datatype for each column (either s-string or n-number)
dataType = {'s','n','n','n','n','n','s','n','s','n','n','n','n','n'};

% - -read the heading and initialize a data structure 
% -- each field name of the data structure corresponding the name defined in the heading
%    notice cell for string array, simple array for numbers
heading = line2strcell(l);
nCols = length(heading);    % number of columns
S = [];
for icol=1:nCols
  if (dataType{icol} == 's'), S = setfield(S,heading{icol},{}); end
  if (dataType{icol} == 'n'), S = setfield(S,heading{icol},[]); end
end

% now read the data 
% -- notice that the line length can be less than nCols, we first force the 
%    first data to have nCols, and use matlab's dynamic array sizing feature to 
%    simply add to the data
data = zeros(1,nCols);            % forcing the data to at least 1 line with nCols elements
iline = 1;                        % data line counter
% -- loop until the end of file
while feof(fid)==0
  l = fgetl(fid);
  % a = line2numarray(l);           
  d = line2agidata(l);           % d is a cell of line data
  
  for icol=1:nCols
    v = getfield(S,heading{icol});    % pull the existing data from structure
    v(iline,1) = d{icol};             % append data         
    S = setfield(S,heading{icol},v);  % update structure
  end
  iline = iline+1;
end

% now close the file
fclose(fid);

