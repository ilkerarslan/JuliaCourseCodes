score = 70
if score > 60
    println("passed")
end

score > 60

score = 40;
if score > 60
    println("passed")
end

if score > 60 
    println("Congratulations, you passed!")
else
    println("I am sorry. You failed.")
end


score = 75
if score > 60 
    println("Congratulations, you passed!")
else
    println("I am sorry. You failed.")
end


score = 25
if score > 60 
    println("Congratulations, you passed!")
else
    println("I am sorry. You failed.")
end

if score ≥ 85
    println("Your grade is A")
else
    if score ≥ 70
        println("Your grade is B")
    else
        if score ≥ 60
            println("Your grade is C")
        else
            println("Your score is F")
        end
    end
end

if score ≥ 85
    println("Your grade is A")
elseif score ≥ 70
    println("Your grade is B")
elseif score ≥ 60
    println("Your grade is C")
else 
    println("Your score is F")
end


# if score ≥ 85 && score < 100
# if 85 ≤ score < 100

println("Enter your score: ")
score = readline();
score = parse(Int64, score)

if 85 ≤ score ≤ 100
    println("Your grade is A")
elseif 70 ≤ score < 85
    println("Your grade is B")
elseif 60 ≤ score <70
    println("Your grade is C")
elseif 0 ≤ score < 60 
    println("Your score is F")
else
    println("You haven't entered a valid score")
end
