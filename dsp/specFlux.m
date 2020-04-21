function output = specFlux(X)
    dX = diff([X(1) X]);
    output = sqrt(sum(dX.^2))/size(X,1);
end