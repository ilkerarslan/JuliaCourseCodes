using Sockets

server = listen(8000)
conn = accept(server)
line = readline(conn)
write(conn, "Hello client. How are you?\n")
close(conn)

server = listen(2000)
con = accept(server)
write(con, "Hi, client! What can I do for you?\n")

while true
    line = readline(con)
    println("Incoming message >>> $line")
end

using Sockets

server = listen(2001)

while true
    conn = accept(server)
    @async begin 
        while true
            line = readline(conn)
            println("Incoming message >>> $line")
        end
    end
end
