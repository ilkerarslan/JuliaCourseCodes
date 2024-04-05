using JSON, DataFrames
cd("02DSWJ/Data/03ImportData")

text = read("tvseries.json", String)
dict = JSON.parse(text)
df = DataFrame(dict)

read("tvseries.json", String) |> JSON.parse |> DataFrame 

notes = """
{
    "name": "Obi Wan", 
    "surname": "Kenobi", 
    "studentId": 1234,     
    "scores": [
        {"course": "Flight", "score": 100},
        {"course": "Fencing", "score": 95},
        {"course": "Robotics", "score": 90},
        {"course": "Astronomy", "score": 85}        
    ]
}
"""

write("notes_json.json", notes)

notes_dict = Dict(
    "name" => "Obi Wan",
    "surname" => "Kenobi",
    "studentId" => 1234,
    "scores" => [
        Dict("course" => "Flight", "score" => 100),
        Dict("course" => "Fencing", "score" => 95),
        Dict("course" => "Robotics", "score" => 90),
        Dict("course" => "Astronomy", "score" => 85)
    ]
)

notes_json = JSON.json(notes_dict)
write("notes_json_02.json", notes_json)