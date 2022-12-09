x = [35, 1, -7, 12, -11, -17]

sort(x)
x 

sort!(x)
x 


function padwithzero(vector, n)    
    x = vcat(zeros(n), vector, zeros(n))
    return x
end


padwithzero(x, 3)
x

function padwithzero!(vec, n)
    for i in 1:n 
        insert!(vec, 1, 0)
    end

    for i in 1:n 
        append!(vec, 0)
    end
end

padwithzero!(x, 3)
x