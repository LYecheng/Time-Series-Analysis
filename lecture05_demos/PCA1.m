function [Y,PC,V] = PCA1(data)
% PCA1: Perform PCA using covariance.
% data - MxN matrix of input data
% (M dimensions, N trials)
% Y - MxN matrix of projected data
% PC - each column is a PC
% V - Mx1 matrix of variances

[~,N] = size(data);
% subtract off the mean for each dimension
mn = mean(data,2);
data = data - repmat(mn,1,N);

% calculate the covariance matrix
covariance = 1 / (N-1) * (data * data');

% find the eigenvectors and eigenvalues
[PC, V] = eig(covariance);

% extract diagonal of matrix as vector
V = diag(V);

% sort the variances in decreasing order
[~, rindices] = sort(-1*V);
V = V(rindices);
PC = PC(:,rindices);

% project the original data set
Y = PC' * data;

