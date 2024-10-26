r_array = [20, 8]
g = 1

while (r_array[1] %2 == 0) && (r_array[2] % 2 == 0)
    r_array[1] /= 2
    r_array[2] /= 2
    global  g *= 2
end

u = r_array[1]
v = r_array[2]
x_y_array = Float64[1, 0, 0, 1]

while u != 0
    while (u%2 != 1)
        global u /= 2  
        if x_y_array[1]%2 == 0 && x_y_array[2]%2 ==0
            x_y_array[1] /=2
            x_y_array[2] /=2
        else
            x_y_array[1] = (x_y_array[1] + r_array[2])/2
            x_y_array[2] = (x_y_array[2] - r_array[1])/2
        end
    end
    while (v%2 != 1)
        global v /= 2  
        if x_y_array[3]%2 == 0 && x_y_array[4]%2 ==0
            x_y_array[3] /=2
            x_y_array[4] /=2
        else
            x_y_array[3] = (x_y_array[3] + r_array[2])/2
            x_y_array[4] = (x_y_array[4] - r_array[1])/2
        end
    end
    if u >= v
        global u -= v
        x_y_array[1] -= x_y_array[3]
        x_y_array[2] -= x_y_array[4]
    else
        global  v -= u
        x_y_array[3] -= x_y_array[1]
        x_y_array[4] -= x_y_array[2]
    end   
end

d = Int(g*v)
println("d(НОД):", d)
println("x:", x_y_array[3])
println("y:", x_y_array[4])