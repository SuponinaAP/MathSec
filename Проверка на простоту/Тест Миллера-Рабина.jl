n = 5
a = 2

# Проверка условий

if (n % 2 == 0) | (n < 5)
    println("Введите другое n")
else
    println("Всё отлично продолжаем работу")
end

if (a < 2) | (a > n - 2)
    println("Введите другое a")
else
    println("Всё отлично продолжаем работу")
end


function devide(a)
    k = 0
    while a % 2 == 0 
        k += 1
        a = Int(a / 2)
    end
    return a, k
end

r, s = devide(n-1)

y = (a * r) % n

function miller_rabin(y, n, s)
    if y == 1 || y == n - 1
        return "Число $n, вероятно, простое"
    end

    for j in 1:(s - 1)
        y = (y * y) % n

        if y == n - 1
            return "Число $n, вероятно, простое"
        end

        if y == 1
            return "Число $n составное"
        end
end

# Если ни одно из условий не выполнено, то n составное
return "Число $n составное"
end

res = miller_rabin(y, n, s)
println(res)