n = 17
a = 3

# Проверка условий

if (n % 2 == 0) || (n < 5)
    println("Введите другое n")
else
    println("Всё отлично продолжаем работу")
end


if (a < 2) || (a > n - 2)
    println("Введите другое a")
else
    println("Всё отлично продолжаем работу")
end


# функция для приведения a к виду 2^k*a1

function devide(a)
    k = 0
    while a % 2 == 0 
        k += 1
        a = Int(a / 2)
    end
    return a, k
end

# Символ Якоби

function jacoby(a, n, g = 1)

    while a >= 0
        if a == 0
            return 0
        elseif a == 1
            return g
        end

        a1, k = devide(a)

        if (k % 2 == 0)
            s = 1
        else 
            if ((n-1) % 8 == 0) || ((n + 1) % 8 == 0)
                s = 1
            elseif ((n - 3) % 8 == 0) || ((n + 3) % 8 == 0)
                s = -1
            end
        end

        if a1 == 1
            result = g*s
            return result
        end

        if ((n - 3) % 4 == 0) && ((a1 - 3) % 4 == 0)
            s = s * (-1)
        end

        a = n % a1
        n = a1
        g = g * s
    end
end

r = (a^((n-1)/2)) % n

function solovey_shtrassen(r, n, a)
    if r != 1 && r != n - 1 
        return("Число $n составное")
    end

    s = jacoby(a, n)

    if s < 0
        s += n
    end

    if (r - s) % n == 0
        return("Число $n, вероятно, простое")
    else
        return("Число $n составное")
    end
end

res = solovey_shtrassen(r, n, a)
println(res)