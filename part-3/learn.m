function [w] = learn(X, y)
  bias = ones(size(X,1),1);
  X_nou = [X, bias];
  [Q,R] = Householder(X_nou);
  w = SST(R, (Q')*y);
end
