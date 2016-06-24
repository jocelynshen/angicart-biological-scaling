function status = isVein(vId)
% function status = isVein(vId)
% it checks if vId represents a valid vein (xx.001) or not
% input: 
%  vId -- vein ID
% output
%  status -- true/false
%
% history
%  6/20/16: Joce Shen, first written
%
% matlab has trouble ==0.001, so we manually set == to be with 100xeps
% we scale it by 1000 to be int operation
%
%if(vId*1000)
if (abs(mod(vId,1)-.001)<1.e2*eps)
  status = 1;
else
  status = 0;
end