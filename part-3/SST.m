function [x] = SST(A, b)
  x = zeros (min ([size(A)]), 1);
  n =  min ([size(A)]);
 for i = n:-1:1
  x(i,1) = (b(i,1) - sum (A(i,(i + 1):n)*x((i + 1):n, 1))) ./ A(i,i);  
 endfor
end 