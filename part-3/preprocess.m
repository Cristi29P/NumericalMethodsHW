function [X, y] = preprocess(path_to_dataset, histogram, count_bins)
  dir1 = [path_to_dataset 'cats'];
  dir2 = [path_to_dataset 'not_cats'];
  
  files1 = dir([path_to_dataset 'cats/*.jpg']); 
  files2 = dir([path_to_dataset 'not_cats/*.jpg']);
  
  X = zeros(size(files1, 1) + size(files2, 1), count_bins * 3);
  y = zeros(size(files1, 1) + size(files2, 1),1);

  if (strcmp(histogram, 'RGB') == 1)
   for i = 1:length(files1)
      X(i,:) = rgbHistogram([dir1 '/' files1(i).name],count_bins);
   endfor
      
    for i = (length(files1)+1):size(X,1)
      X(i,:) = rgbHistogram([dir2 '/' files2(i-length(files1)).name],count_bins);
    endfor

  elseif (strcmp(histogram, 'HSV') == 1)
    for i = 1:length(files1)
        X(i,:) = hsvHistogram([dir1 '/' files1(i).name],count_bins);
    endfor
    
    for i = (length(files1)+1):size(X,1)
      X(i,:) = hsvHistogram([dir2 '/' files2(i-length(files1)).name],count_bins);
    endfor
  endif
  
  y(1:size(files1,1), 1) = 1;
  y((size(files1,1)+1):size(y,1), 1) = -1;
endfunction
