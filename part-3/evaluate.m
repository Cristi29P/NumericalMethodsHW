function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
  dir1 = [path_to_testset 'cats'];
  dir2 = [path_to_testset 'not_cats'];
  
  files1 = dir([path_to_testset 'cats/*.jpg']); 
  files2 = dir([path_to_testset 'not_cats/*.jpg']); 
  
  X = zeros(count_bins*3, size(files1, 1) + size(files2, 1));
  
  if (strcmp(histogram, 'RGB') == 1)
    for i = 1:length(files1)
      X(:,i) = (rgbHistogram([dir1 '/' files1(i).name],count_bins))';
   endfor
   for i = (length(files1)+1):size(X,2)
      X(:,i) = (rgbHistogram([dir2 '/' files2(i-length(files1)).name],count_bins))';
    endfor
  elseif (strcmp(histogram, 'HSV') == 1)
     for i = 1:length(files1)
        X(:,i) = (hsvHistogram([dir1 '/' files1(i).name],count_bins))';
    endfor
    for i = (length(files1)+1):size(X,2)
        X(:,i) = (hsvHistogram([dir2 '/' files2(i-length(files1)).name],count_bins))';
    endfor
  endif
  
  X = [X ; ones(1, size(files1, 1) + size(files2, 1))];
  
  val = (w')*X;

  nr_total_poze = size(files1, 1) + size(files2, 1);
  nimerite = 0;
  
  nimerite1 = 0;
  nimerite2 = 0;
  
  for i = 1:size(files1, 1)
    if (val(1, i) >= 0)
      nimerite1++;
    endif
  endfor
  
  for i = (size(files1, 1) + 1):size(val, 2)
    if (val(1, i) < 0)
      nimerite2++;
    endif
  endfor
  
  nimerite = nimerite1 + nimerite2; 
  percentage = (nimerite/nr_total_poze);
  
endfunction