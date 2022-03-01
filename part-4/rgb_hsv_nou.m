function [img_hsv] = rgb_hsv_nou(img_rgb)
  img_hsv = zeros (size (img_rgb, 1), size (img_rgb, 2), size (img_rgb, 3));
  img_rgb = cast (img_rgb, "double") ./ 255;
  
  R_nou = img_rgb(:,:,1);
  G_nou = img_rgb(:,:,2);
  B_nou = img_rgb(:,:,3);
  
  RGB = zeros (size (R_nou, 1), size (R_nou, 2), 3);
  
  RGB(:,:,1) = R_nou;
  RGB(:,:,2) = G_nou;
  RGB(:,:,3) = B_nou;
  
  C_min = min (RGB, [], 3);
  C_max = max (RGB, [], 3);
  
  delta = C_max - C_min;
  
  ind1 = (delta == 0);
  ind2 = ((C_max == R_nou) & (delta != 0));
  ind3 = ((C_max == G_nou) & (delta != 0));
  ind4 = ((C_max == B_nou) & (delta != 0));
 
  img_hsv(ind1) = 0;
  img_hsv(ind2) = 60 * mod (((G_nou(ind2) - B_nou(ind2)) ./ delta(ind2)), 6);
  img_hsv(ind3) = 60 * (((B_nou(ind3) - R_nou(ind3)) ./ delta(ind3)) + 2);  
  img_hsv(ind4) = 60 * (((R_nou(ind4) - G_nou(ind4)) ./ delta(ind4)) + 4);
  
  C_max(C_max == 0) = Inf;
  img_hsv(:,:,2) = delta ./ C_max;
  
  img_hsv(:,:,1) = img_hsv(:,:,1) ./ 360;
  img_hsv(:,:,3) = C_max;
endfunction
