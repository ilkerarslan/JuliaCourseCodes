print("Enter your age: ")
age = readline()
#age = parse(Int, age)
(tryparse(Int, age) === nothing) && (println("Please enter a numeric input!"); exit())
(tryparse(Int, age) === nothing) || (age = parse(Int, age))

(0 < age < 100) && (println("Your age is $age."))
(0 < age < 100) || (println("Please enter a number between 0 and 100!"))