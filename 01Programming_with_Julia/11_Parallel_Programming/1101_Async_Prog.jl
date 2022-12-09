t1 = @task begin 
    println("beginning task t1")
    sleep(3)
    println("finished task t1")
end

t2 = Task( () -> 
    begin
        println("beginning task t2")
        sleep(3)
        println("finished task t2")
    end
)


istaskstarted(t1)
istaskdone(t1)

schedule(t1)

schedule(t2); wait(t2)

istaskstarted(t1)
istaskdone(t1)

urllist = ["https://www.google.com", "https://www.yahoo.com",
           "https://www.facebook.com", "https://docs.julialang.org/",
           "https://www.udemy.com", "https://www.coursera.org/"]

@time for url ∈ urllist
    download(url)
end

@time @sync for url ∈ urllist 
    @async download(url)
end

function inputTask(ch::Channel)
    for i ∈ 1:5
        put!(ch, i^2)
    end
end
    
chnl = Channel(inputTask)

take!(chnl)
take!(chnl)
take!(chnl)
take!(chnl)
take!(chnl)
take!(chnl)

for i in Channel(inputTask)
    @show i 
end