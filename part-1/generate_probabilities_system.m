function [A, b] = generate_probabilities_system(rows)
  nr_elemente = rows * (rows + 1) / 2;
  
  A = zeros (nr_elemente, nr_elemente);
  
  aux = zeros (rows, rows);
  
  k = 0;
  i1 = 0;
  j1 = 0;
  vecini = 0;
  
  for i = 1:rows
    for j = 1:i
      k = k + 1;
      aux(i, j) = k;
    endfor
  endfor
  
  k = 0;
  
  for i = 1:rows
    for j = 1:i
      vecini = 0;
      k = k + 1;
      
      i1 = i - 1;
      j1 = j;
      
      if ((1 <= i1 && i1 <= rows) && (i1 >= j1 && j1 >= 1))
        vecini = vecini + 1;
        A(k, aux(i1, j1)) = -1;
      endif
      
      i1 = i - 1;
      j1 = j - 1;
      
      if ((1<=i1 && i1<=rows) && (i1>=j1 && j1>=1))
        vecini = vecini + 1;
        A(k, aux(i1, j1)) = -1;
      endif
      
      i1 = i;
      j1 = j - 1;
      
      if ((1 <= i1 && i1 <= rows) && (i1 >= j1 && j1 >= 1))
        vecini = vecini + 1;
        A(k, aux(i1, j1)) = -1;
      endif
      
      
      i1 = i;
      j1 = j + 1;
      
      if ((1 <= i1 && i1 <= rows) && (i1 >= j1 && j1 >= 1))
        vecini = vecini + 1;
        A(k, aux(i1, j1)) = -1;
      endif

      i1 = i + 1;
      j1 = j;
      
      if ((1 <= i1 && i1 <= rows) && (i1 >= j1 && j1 >= 1))
        vecini = vecini + 1;
        A(k, aux(i1, j1)) = -1;
      endif
      
      i1 = i + 1;
      j1 = j + 1;
      
      if ((1 <= i1 && i1 <= rows) && (i1 >= j1 && j1 >= 1))
        vecini = vecini + 1;
        A(k, aux(i1, j1)) = -1;
      endif
      
      if (vecini == 2)
        A(k, k) = 4;
      elseif (vecini == 4)
        A(k, k) = 5;
      elseif (vecini == 6)
        A(k, k) = 6;
      endif
      
    endfor  
  endfor
  
  b = zeros (nr_elemente, 1);
  
  a = nr_elemente - rows + 1;
  c = nr_elemente;
  
  for i = a:c
    b(i, 1) = 1;
  endfor
endfunction