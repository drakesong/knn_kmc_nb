function plotProgress(X, centroids, previous, idx, idx_cor, i, error, ...
    max_iters)
%PLOTPROGRESSKMEANS displays the progress of k-Means as it is running.

% Plot the data
for j = 1:size(idx, 1)
    if idx_cor(j) == 0
        plot(X(j, 1), X(j, 2), 'r.')
    else
        plot(X(j, 1), X(j, 2), 'b.')
    end
end

% Plot the centroids as black x's
if i < max_iters
    plot(centroids(:, 1), centroids(:, 2), 'x', 'MarkerEdgeColor','k', ...
         'MarkerSize', 10, 'LineWidth', 3);
% Use magenta x for the last iteration for a clearer picture
else
    plot(centroids(:, 1), centroids(:, 2), 'x', 'MarkerEdgeColor','m', ...
         'MarkerSize', 10, 'LineWidth', 3);
end

% Plot the history of the centroids with lines
for j=1:size(centroids,1)
    x_centroid = [centroids(j, 1), previous(j, 1)];
    y_centroid = [centroids(j, 2), previous(j, 2)];
    line(x_centroid(:), y_centroid(:));
end

% Title
title(sprintf('K-Means Clustering 2D\nIteration number %d\nError: %d', ...
    i, error))

end

