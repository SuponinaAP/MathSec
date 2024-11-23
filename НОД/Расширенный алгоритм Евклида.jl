r_array = [1359331, 123939]
x_array = Float64[1, 0]
y_array = Float64[0, 1]
i = 1

while r_array[i]%r_array[i+1] != 0
    global q = div(r_array[i], r_array[i+1]) 
    push!(r_array, r_array[i]%r_array[i+1])
    push!(x_array, x_array[i]-q*x_array[i+1])
    push!(y_array, y_array[i]-q*y_array[i+1])
    global i += 1
end

println("d(НОД):", r_array[i+1])
println("x:", x_array[i+1])
println("y:", y_array[i+1])