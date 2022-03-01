function [sol] = rgbHistogram(path_to_image, count_bins)
  imagine = imread(path_to_image);
  edges = [0:256/count_bins:255, 255];
  freq = zeros(3, count_bins);

  aux = histc(imagine, edges);
  sum1 = sum(aux(:,:,1),2);
  sum2 = sum(aux(:,:,2),2);
  sum3 = sum(aux(:,:,3),2);
  
  sum1(size(sum1,1)-1,1) += sum1(size(sum1,1),1);
  sum2(size(sum2,1)-1,1) += sum2(size(sum2,1),1);
  sum3(size(sum3,1)-1,1) += sum3(size(sum3,1),1);
  
  sum1 = sum1';
  sum2 = sum2';
  sum3 = sum3';
  
  freq(1, :) += sum1(1, 1:(size(sum1, 2)-1));
  freq(2, :) += sum2(1, 1:(size(sum2, 2)-1));
  freq(3, :) += sum3(1, 1:(size(sum3, 2)-1));
    
  sol = [freq(1,:), freq(2,:), freq(3,:)];  
end
