volume = begin
    a = 12
    b = 9
    c = 5
    a * b * c
end

area = begin
    a = 12
    b = 9
    c = 5
    2 * (a*b + a*c + b*c)
end

volume

area

volume = (a=12; b=9; c=5; a*b*c)
area = (a=12; b=9; c=5; 2*(a*b + a*c + b*c))

volume = (a=12;
          b=9;
          c=5;
          a*b*c)

