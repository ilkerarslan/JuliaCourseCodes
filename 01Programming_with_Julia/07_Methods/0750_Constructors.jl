# Constructors
mutable struct ModelVars 
    x₁::Float64 
    x₂::Float64 
    x₃::Float64 
end

fieldnames(ModelVars)

m1 = ModelVars(2.5, 5.6, 7.8)
methods(ModelVars)
ModelVars(3, 5, 7)

m1.x₁
m1.x₂

m1.x₃ = 6.2;
m1

abstract type Student end 
Student()

mutable struct CSStudent <: Student 
    name::String
    student_id::Int64 
    gpa::Float64 
    specialization::String 
    programming_language::String 
end

methods(CSStudent)

cs1 = CSStudent("George", 123456, 3.75, "Data Science", "Julia")

CSStudent(name, id, gpa) = CSStudent(name, id, gpa, "Data Science", "Julia")
methods(CSStudent)

cs2 = CSStudent("Mary", 112233, 3.95)
cs3 = CSStudent("Ali", 135797, 3.11, "Development", "Java")

mutable struct DataScienceStudent <: CSStudent end
end

function CSStudent(; name,
                     student_id,
                     gpa = NaN,
                     specialization = "Data Science",
                     programming_language = "Julia")
    return CSStudent(name, student_id, gpa, specialization, programming_language)  
end

cs4 = CSStudent(name="Mario", student_id=654321, specialization="Mobile Development", programming_language="Kotlin")
cs4.gpa = 3.4;
cs4 

students = CSStudent[]
push!(students, cs1, cs2, cs3, cs4)


mutable struct MathStudent 
    name::String 
    student_id::Int64 
    gpa::Float64 

    MathStudent(name, student_id, gpa) = gpa < 0 ? throw("gpa cannot be negative") : new(name, student_id, gpa)
end

m1 = MathStudent("Karl", 111222, 3.4)
m2 = MathStudent("Ben", 345123, -3.0)

mutable struct EconStudent 
    name::String 
    student_id::Int64 
    gpa::Float64 

    function EconStudent(name, student_id, gpa)
        if name == "" 
            throw("Student name cannot be empty")
        elseif student_id == NaN || student_id == 0 
            throw("Student ID cannot be empty")
        elseif gpa < 0 || gpa > 4.0 
            throw("Enter a valid gpa")
        else
            new(name, student_id, gpa)
        end        
    end
end

es1 = EconStudent("", 123456, 3.2)
es1 = EconStudent("Daniel", 0, 3.2)
es1 = EconStudent("Daniel", 456789, 5)
es1 = EconStudent("Daniel", 456789, 3.2)

MathStudent()

mutable struct PhysStudent <: Student 
    name::String 
    student_id::Int64 
    gpa::Float64 

    PhysStudent() = new()
end

ps1 = PhysStudent()
methods(PhysStudent)

mutable struct Course 
    name::String 
    student::Array{Union{CSStudent, MathStudent, EconStudent}, 1}
    opened::Bool 

    Course(name::String) = new(name::String, String[], false)
    Course(name::String, members) = new(name, members, length(members) ≥ 5)
end

julia101 = Course("Programming with Julia", [cs1, cs2, cs3, cs4, m1, es1])