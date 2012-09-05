# Trains a linear model on a 2d data set
# Stephen Olsen

# Builds the hypothesis function from the parameters
function buildh(t0, t1)
    return x -> t0 + t1 * x
end

# Compute the cost of the hypothesis
# This is the value that the gradian descent is trying to minimize.
function cost(data, t0, t1)

end

function step(data, alpha, t0, t1)
    m = size(data, 1) # Number data points

    # [x, y] * [t1, -1] + t0
    # = t0 + t1x - y
    inner = data * [t1, -1] + t0 

    new1 = t0 - (alpha / m) * sum(inner)
    new2 = t1 - (alpha / m) * sum(inner + data[:,1])
    
    return new1, new2
end

# Gradiant Descent
function gd(data, t0, t1)
    alpha = 0.01

    for i in 1:1500
        n0, n1 = step(data, alpha, t0, t1)
        t0, t1 = n0, n1
    end
    
    return t0, t1
end

# Fits a liner model to the data and returns the hypothesis
function train(data)
    t0, t1 = gd(data, 2, 2)
    return buildh(t0, t1), t0, t1
end

testset = [5 4;
           3 4;
           0 1;
           4 3]
