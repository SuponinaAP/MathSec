n = 3
u = 222
v = 600
b = 10

function sum_(n,u,v,b)
    j = n
    k = 0
    w = []
    for j in n:-1:1
        u_j = u % b
        v_j = v % b
        push!(w, (u_j+v_j+k) % b)
        k = floor((u_j+v_j+k) / b)
        u = div(u, b)
        v = div(v, b)
    end
    w0 = k
    if w0 == 1
        push!(w, w0)
        result = 0
        for i in n:-1:0
            result += (10 ^ i) * w[j+1]
            j -= 1
        end
            return result
    else
        result = 0
        for i in n-1:-1:0
            result += (10 ^ i) * w[j]
            j -= 1
        end
        return result
    end
end
w = sum_(n,u,v,b)

println(w)

u = 555
v = 132

function sub_(n,u,v,b)
    j = n
    k = 0
    w = []
    for j in n:-1:1
        u_j = u % b
        v_j = v % b
        push!(w, (u_j-v_j+k) % b)
        k = floor((u_j-v_j+k) / b)
        u = div(u, b)
        v = div(v, b)
    end
    result = 0
    for i in n-1:-1:0
        result += (10 ^ i) * w[j]
        j -= 1
    end
    return result
end
w = sub_(n,u,v,b)

println(w)

u = [5; 0; 0]
v = [4; 5]
n = 3
m = 2
b = 10

function mul(u, v, n, m, b)
    w = zeros(Int64, 1, m+n)
    j = m
    while j > 0
        if v[j] == 0
            w[j] == 0
        else
            i = n
            k = 0

            while i > 0
                t = u[i] * v[j] + w[i+j] + k
                w[i+j] = t % b
                k = div(t, b)
                i = i - 1
            end
            w[j] = k
        end
        j -= 1
    end
    k = n + m - 1
    if w[1] == 0
        w = w[2:n+m]
        k -= 1
    end
    result = 0
    for i in 1:1:k
        result += w[i] * (10 ^ k)
        k -= 1
    end
    return result
end

w = mul(u, v, n, m, b)
println(w)

u = [1, 4, 4]  
v = [3, 2]     
n = 3
m = 2
b = 10
    
function fast_mul(u, v, n, m, b)

    w = zeros(Int, m + n)
    f = m + n - 1
    for s in 0:f
        t = 0  
        for i in 0:s
            ui = n - i
            vi = m - s + i
            if ui >= 1 && ui <= n && vi >= 1 && vi <= m
                t += u[ui] * v[vi]
            end
        end
    
        z = (m + n) - s
        t += w[z]
        w[z] = t % b
        k = div(t, b) 
        if z > 1
            w[z - 1] += k
        end
    end
    
    return w
end

println(fast_mul(u, v, n, m, b))

q = Int[]   # Quotient digits
    r = 0      # Remainder as integer

    # Convert u to string for digit-by-digit processing
    u_str = string(u)
    v_str = string(v)
    
    # Convert v to integer in base b
    v_val = v

    for c in u_str
        # Append current digit to remainder
        r = r * b + parse(Int, string(c))
        
        # Determine the current quotient digit
        x = 0
        while r >= v_val
            r -= v_val
            x += 1
            if x == b - 1
                break
            end
        end
        push!(q, x)
    end

    # Remove leading zeros from the quotient
    while length(q) > 1 && q[1] == 0
        q = q[2:end]
    end

    return q, r
end

# Example Usage

# Define the base
b = 10

# Define Dividend and Divisor
uu = 389725851
vv = 79116

# Perform Division
quotient, remainder = standard_long_division(uu, vv, b)

# Function to convert digit array to string
function display_number(digits::Vector{Int})::String
    # Remove leading zeros
    start = findfirst(x -> x != 0, digits)
    if isnothing(start)
        return "0"
    else
        return join(digits[start:end], "")
    end
end

# Display Results
println("Частное =", display_number(quotient), " Остаток =", remainder)