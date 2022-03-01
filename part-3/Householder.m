function [Q, R] = Householder(A)
  [nr_randuri, nr_coloane] = size (A);
  H = eye (nr_randuri);
  for p = 1:min ([nr_randuri - 1, nr_coloane])
    v_p = zeros (nr_randuri, 1);
    v_p((p + 1):nr_randuri, 1) = A((p + 1):nr_randuri, p);
    sigma = sign(A(p,p))*norm(A(p:nr_randuri,p));
    v_p(p, 1) = A(p,p) + sigma;
    H_aux = eye (nr_randuri) - 2 * ((v_p * v_p') / (v_p' * v_p));
    A = H_aux * A;
    H = H_aux * H;
  endfor
  Q = H';
  R = A;
endfunction