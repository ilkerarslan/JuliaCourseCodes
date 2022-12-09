x = rand(-10:10, 20);

square(x) = x.^2;
(sum ∘ square)(x)
x |> square |> sum

x |> (a -> a .- sum(a)/length(a)) .|> square |> sum |> sqrt



str = "Writing functions in Julia Programming"
str |> split .|> length

str |> split .|> first 