function [centroids] = clustering_pc(points, NC)  
  [nr_puncte, nr_dimensiuni] = size (points);
 
  M_0 = cell (NC, 1);
  centroids_0 = zeros (NC, nr_dimensiuni);
 
  for i = 1:nr_puncte
    rest = mod (i, NC);  
    aux = points(i,:);  
    if (rest == 0)
      M_0{rest + NC} = [M_0{rest + NC}; aux];
    elseif (rest != 0)
      M_0{rest} = [M_0{rest}; aux];
    endif
  endfor

 
  for i = 1:NC
    n = size (M_0{i}, 1);
    for j = 1:nr_dimensiuni
      suma = 0;
      suma = sum (M_0{i}(:,j));
      centroids_0(i , j) = suma / n;
    endfor
  endfor
 
  M = cell (NC, 1);
  centroids = zeros (NC, nr_dimensiuni);
 
 
  while (1)
    for i = 1:nr_puncte
      min_dist = 99999999;
      min_index = 0;
      for j = 1:NC
        dist = norm (points(i,:) - centroids_0(j,:));
        if (dist < min_dist)
          min_dist = dist; 
          min_index = j;
        endif
      endfor   
      M{min_index} = [M{min_index}; points(i,:)];
    endfor
   

   
  for i = 1:NC
    n = size (M{i}, 1);
    for j = 1:nr_dimensiuni
      suma = 0;
      suma = sum (M{i}(:,j));
      centroids(i,j) = suma / n;
    endfor
  endfor
     
  if(isequal (centroids_0, centroids))
    break;
  endif
  
  centroids_0 = centroids;

  M = cell (NC, 1);
  endwhile
 
endfunction
