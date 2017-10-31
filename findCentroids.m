function idx = findCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the closest centroid for every example

% Initialize values
K = size(centroids, 1);
idx = zeros(size(X,1), 1);

% Compute and find closest centroid
for i = 1:size(X, 1)
  min_dist = inf;
  for k = 1:K
    diff = X(i, :)' - centroids(k, :)';
    dist = diff' * diff;
    if (dist < min_dist)
      idx(i) = k;
      min_dist = dist;
    end
  end
end

end

