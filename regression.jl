# Trains a linear model on a 2d data set
# Stephen Olsen

# Builds the hypothesis function from the parameters
function buildh(t0, t1)
    return x -> t0 + t1 * x
end

function step(data, alpha, t0, t1)
    m = size(data, 1) # Number data points

    inner = data * [t1, -1] + t0 

    new1 = t0 - (alpha / m) * sum(inner)
    new2 = t1 - (alpha / m) * sum(inner + data[:,1])
    
    return new1, new2
end

# Gradiant Descent
function gd(data, t0, t1)
    alpha = 0.000005

    steplength = 1
    
    while steplength != 0
        println(t0)
        println(t1)
        n0, n1 = step(data, alpha, t0, t1)
        steplength = (n0 - t0) + (n1 - t1)
        println(n0)
        println(n1)
        println(steplength)
        t0 = n0
        t1 = n1
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
