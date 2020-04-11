function yout = QAM_mod(index)
%QAM_RECT_AB QAM-modulation alphabet position
%   YOUT = QAM_RECT_AB(INDEX) returns a matrix of correct positions in 
%   the constellation diagram corresponding to INDEX-th order modulation format
if index == 2
    yout = [-1, 1];
elseif index == 4
   yout = [-1-1i, -1+1i, 1-1i, 1+1i];
elseif index == 16
  yout = [-3-3i, -3-1*1i, -1-3i, -1-1*1i, -3+1*1i, -3+3i, -1+1*1i, -1+3i, 1-3*1i, 1-1*1i, 3-3i, 3-1*1i, 1+1*1i, 1+3i, 3+1*1i, 3+3i];
elseif index == 32
  yout = [-3-5*1i,-1-5*1i,1-5*1i,3-5*1i,-5-3*1i,-3-3*1i,-1-3*1i,1-3*1i,3-3*1i,5-3*1i,-5-1*1i,-3-1*1i,-1-1*1i,1-1*1i,3-1*1i,5-1*1i,-5+1*1i,-3+1*1i,-1+1*1i,1+1*1i,3+1*1i,5+1*1i,-5+3*1i,-3+3*1i,-1+3*1i,1+3*1i,3+3*1i,5+3*1i,-3+5*1i,-1+5*1i,1+5*1i,3+5*1i];
elseif index == 64
  yout = [-7-7*1i,-5-7*1i,-3-7*1i,-1-7*1i,1-7*1i,3-7*1i,5-7*1i,7-7*1i,-7-5*1i,-5-5*1i,-3-5*1i,-1-5*1i,1-5*1i,3-5*1i,5-5*1i,7-5*1i,-7-3*1i,-5-3*1i,-3-3*1i,-1-3*1i,1-3*1i,3-3*1i,5-3*1i,7-3*1i,-7-1*1i,-5-1*1i,-3-1*1i,-1-1*1i,1-1*1i,3-1*1i,5-1*1i,7-1*1i,-7+1*1i,-5+1*1i,-3+1*1i,-1+1*1i,1+1*1i,3+1*1i,5+1*1i,7+1*1i,-7+3*1i,-5+3*1i,-3+3*1i,-1+3*1i,1+3*1i,3+3*1i,5+3*1i,7+3*1i,-7+5*1i,-5+5*1i,-3+5*1i,-1+5*1i,1+5*1i,3+5*1i,5+5*1i,7+5*1i,-7+7*1i,-5+7*1i,-3+7*1i,-1+7*1i,1+7*1i,3+7*1i,5+7*1i,7+7*1i];
else
 disp('wrong value');
end
