function [x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c, tol)
  nr_linii = 0;
  nr_coloane = 0;
  
  [nr_linii, nr_coloane] = size (c);
  
  prev_x = zeros (nr_linii, 1);
  x = zeros (nr_linii, 1);
 
  while (1) 
    x = csr_multiplication (G_values, G_colind, G_rowptr, prev_x) + c;
    err = norm (x - prev_x);
    if (err < tol)
      return;
    endif
    prev_x = x;
  endwhile

endfunction