function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.

% Initialize values
[m, n] = size(X);
centroids = zeros(K, n);

% Compute centroids
for k = 1:K
  a = 0;
  sum = zeros(n, 1);
  for i = 1:m
    if (idx(i) == k)
      sum = sum + X(i, :)';
      a = a + 1;
    end
  end
  centroids(k, :) = (sum / a)';
end

end