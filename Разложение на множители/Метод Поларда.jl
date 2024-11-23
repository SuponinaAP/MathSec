function euclid(n, number1)
    r_array = [number1, n]
    x_array = Float64[1, 0]
    y_array = Float64[0, 1]
    i = 1
    while r_array[i+1] != 0
        q = div(r_array[i], r_array[i+1])
        push!(r_array, r_array[i] % r_array[i+1])
        push!(x_array, x_array[i] - q * x_array[i+1])
        push!(y_array, y_array[i] - q * y_array[i+1])
        i += 1
    end

    return r_array[i]
end

function f(a, n)
    a = (a^2 + 5) % n
    return a
end

n = 1359331
c = 1
a = c
b = c
d = 1

function pollard(d, n, a, b)
    while true
        if d > 1 && d < n
            return d
        elseif d == n
            return "Делитель не найден"
        elseif d == 1
            a = f(a, n)
            b = f(f(b, n), n)
            d = euclid(n, a-b)
            if d < 0
                d *= -1
            end
        end
    end
end

res = pollard(d, n, a, b)
println(res)