function data = line2agidata(line)
%line2agidata: clean a line read from a file and convert it a agi data
%SYNOPSIS

%
%INPUT:

%
%OUTPUT:

%	
%DESCRIPTION
% 1. we are using textscan which is a more reliable matlab function
% 2. using dlimiter option to handle "(...)" being treated as a single string
% 
%
%EXAMPLES
% line = '(67, 84, 58)-(69, 41, 61)"	52.619146	867.147162	2.290338	2007	622	#00bdff	156	"(63, 89, 57)-(67, 84, 58)"	0.607586	3.314269	2	1.296157934	0.35296782'
%  a = line2agidata(line) 
%
%HISTORY	
%	Jocie Shen, 7/5/16, first written
%============================================================


% first element is a "(...)" string or a NA string
line = strtrim(line);
% -- if the chaterter is " then a "(...)"
if (line(1)=='"')
  [a,pos] = textscan(line,'"%s',1,'delimiter','"');
else
% -- otherwise a NA string
  [a,pos] = textscan(line,'%s',1);
end
% -- now move line and assign a value
data{1} = a{1};
line = strtrim(line(pos+1:end));

% next read the next 7 numerical numbers, a #string, and another numerical number
[a,pos]=textscan(line,'%f%f%f%d%d%s%d','delimiter',' \b\t');
for i=1:7
  data{1+i} = a{i};
end
line = strtrim(line(pos+1:end));


% the 9th element is a "(...)" string or a NA string
if (line(1)=='"')
  [a,pos] = textscan(line,'"%s',1,'delimiter','"');
else
% -- otherwise a NA string
  [a,pos] = textscan(line,'%s',1);
end
% -- now move line and assign a value
data{9} = a{1};
line = strtrim(line(pos+1:end));

% the rest 10 to 14 are all numerical numbers
a = textscan(line,'%s','delimiter',' \b\t');
for i=1:5
  data{9+i} = str2double(a{1}{i});
end
