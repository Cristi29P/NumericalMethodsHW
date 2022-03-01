function [cost] = compute_cost_pc(points, centroids)
  nr_puncte = size (points, 1);
  nr_centroids = size (centroids, 1);
  cost = 0;
  
  for i = 1:nr_puncte
    dist_min = 999999;    
    for j = 1:nr_centroids
      dist = norm (points(i,:) - centroids(j,:));
      if (dist < dist_min)
        dist_min = dist;
     endif
    endfor
    cost += dist_min;
  endfor
  
endfunction

