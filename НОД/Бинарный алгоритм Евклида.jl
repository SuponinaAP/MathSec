r_array = [20, 8]
g = 1

while (r_array[1] %2 == 0) && (r_array[2] % 2 == 0)
    r_array[1] /= 2
    r_array[2] /= 2
    global  g *= 2
end

u = r_array[1]
v = r_array[2]
while u != 0
    while (u%2 != 1) && (v%2 != 1)
        if u%2 == 0
            global u /= 2  
        else
            global v /= 2 
        end
    end
    if u >= v
        global u = u-v
    else
        global v = v-u
    end   
end

d = Int(g*v)
println(d)