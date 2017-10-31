% Run Naive Bayes
model_nb = fitcnb(training_data, data_label);
pred_label = predict(model_nb, training_data);

% Calculate error
error_nb = sum(abs(pred_label - data_label));

% Plot data
figure;
view(dimension);
hold on

% 2D Plot
if dimension == 2
    for j = 1:size(pred_label, 1)
        if pred_label(j) == 0
            plot(training_data(j, 1), training_data(j, 2), 'r.')
        else
            plot(training_data(j, 1), training_data(j, 2), 'b.')
        end
    end
    
    %{
    % Decided to leave out since the graph becomes too cluttered
    % Plot true values
    for j = 1:size(data_label, 1)
        if data_label(j) == 0
            plot(training_data(j, 1), training_data(j, 2), 'r.')
        else
            plot(training_data(j, 1), training_data(j, 2), 'b.')
        end
    end
    %}
    
    % Title
    title(sprintf('Naive Bayes 2D\nError: %d', error_nb))
    
elseif dimension == 3
    % Turn on grid and rotate3d for better viewing
    grid on;
    rotate3d on;
    
    for j = 1:size(pred_label, 1)
        if pred_label(j) == 0
            scatter3(training_data(j, 1), training_data(j, 2), ...
                training_data(j, 3), 'r.')
        else
            scatter3(training_data(j, 1), training_data(j, 2), ...
                training_data(j, 3), 'b.')
        end
    end
    
    % Title
    title(sprintf('Naive Bayes 3D\nError: %d', error_nb))
end

hold off

% Start test data
fprintf('\nStarting test data...\n');
fprintf('Press enter to continue.\n\n');
pause;

% Test data evaluation
pred_label_test = predict(model_nb, testing_data);

% Calculate test error
error_nb_test = sum(abs(pred_label_test - test_label));

% Start plot
figure;
view(dimension);
hold on

if dimension == 2
    % Set axis for easier comparison between graphs
    axis([-8 8 -15 15]);
    
    % Plot test data
    for j = 1:size(test_label, 1)
        if pred_label_test(j) ==  0
            plot(testing_data(j, 1), testing_data(j, 2), 'ro')
        else
            plot(testing_data(j, 1), testing_data(j, 2), 'bo')
        end
    end
    
    % Plot true values
    fprintf('Circle is the tested label. Plus (+) is the true label.\n\n');
    for j = 1:size(test_label, 1)
        if test_label(j) == 0
            plot(testing_data(j, 1), testing_data(j, 2), 'r+')
        else
            plot(testing_data(j, 1), testing_data(j, 2), 'b+')
        end
    end
    
    % Title
    title(sprintf('Naive Bayes TEST DATA 2D\nError: %d', error_nb_test))
    
elseif dimension == 3
    % Turn on grid and rotate3d for better viewing
    grid on;
    rotate3d on;
    
    % Set axis to match the training plot for better comparison
    axis([6 14 6 14 137 143]);
    
    % Plot test values
    for j = 1:size(pred_label_test, 1)
        if pred_label_test(j) == 0
            scatter3(testing_data(j, 1), testing_data(j, 2), ...
                testing_data(j, 3), 'ro')
        else
            scatter3(testing_data(j, 1), testing_data(j, 2), ...
                testing_data(j, 3), 'bo')
        end
    end
    
    % Plot true values
    fprintf('Dot is the tested label. Diamond is the true label.\n\n');
    for j = 1:size(test_label, 1)
        if test_label(j) == 0
            scatter3(testing_data(j, 1), testing_data(j, 2), ...
                testing_data(j, 3), 'r+')
        else
            scatter3(testing_data(j, 1), testing_data(j, 2), ...
                testing_data(j, 3), 'b+')
        end
    end
    % Title
    title(sprintf('Naive Bayes TEST DATA 3D\nError: %d', error_nb_test))
end 

