function [w] = learn(X, y, lr, epochs)
  i = 1:size (X, 2);
  X(:,i) = (X(:,i) - mean (X(:,i))) ./ std(X(:,i));

  X_nou = [X, ones(size (X, 1), 1)];
  w = (-0.1) + (0.2) * rand (size (X_nou, 2), 1);
  n = size (X, 1);  
  
  for epoch = 1:epochs
    k = randperm (size (X_nou, 1));    
    X_batch = X_nou(k(1:64),:);
    y_batch = y(k(1:64), 1);
    
    # Copyright factorizare Paris Cristian-Tanase 311CA

    for i = 1:size (w, 1)  
     w(i) = w(i) - (lr / n) * sum((X_batch * w - y_batch) .* X_batch(:,i)); 
   endfor
  endfor
endfunction