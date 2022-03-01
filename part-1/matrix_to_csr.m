function [values, colind, rowptr] = matrix_to_csr(A)
  [nr_linii, nr_coloane] = size (A);
  
  values = zeros (1, 0);
  colind = zeros (1, 0);
  rowptr = zeros (1, nr_linii+1);
  nz = 0;  
  k = 0;
  descoperit_nz = 0;
  
  for i = 1:nr_linii
    descoperit_nz = 0;
    for j = 1:nr_coloane  
      if (A(i,j) != 0)  
        k = k + 1;  
        if (descoperit_nz == 0)
          descoperit_nz = 1;
          rowptr(1, i) = k;
        endif
        resize (values, 1, k);
        resize (colind, 1, k);
        
        values(1, k) = A(i, j);
        colind(1, k) = j;
        
        nz = nz + 1;
       endif
    endfor
  endfor
  
  rowptr(1, nr_linii + 1) = nz + 1;
endfunction