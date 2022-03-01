function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
  dir1 = [path_to_testset 'cats'];
  dir2 = [path_to_testset 'not_cats'];
  
  files1 = dir ([path_to_testset 'cats/*.jpg']); 
  files2 = dir ([path_to_testset 'not_cats/*.jpg']); 

  X = zeros (size (files1, 1) + size (files2, 1), count_bins * 3);
  
  [X, y] = preprocess('testset/', histogram, count_bins);
  
  i = 1:size (X, 2);
  X(:,i) = (X(:,i) - mean (X(:,i))) ./ std (X(:,i));

  X = [X, ones(size(X,1),1)];

  val = (w') * X';
 
  nr_total_poze = size (files1, 1) + size (files2, 1);
  
  nimerite = 0;
  nimerite1 = 0;
  nimerite2 = 0;

  for i = 1:size (files1, 1)
    if (val(1, i) >= 0)
      nimerite1++;
    endif
  endfor
  
  for i = (size (files1, 1) + 1):size (val, 2)
    if (val(1, i) < 0)
      nimerite2++;
    endif
  endfor

  nimerite = nimerite1 + nimerite2; 
  percentage = (nimerite / nr_total_poze);
endfunction