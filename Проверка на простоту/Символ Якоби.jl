n = 23
a = 15

# Проверка условий

if (n % 2 == 0) | (n < 3)
    println("Введите другое n")
else
    println("Всё отлично продолжаем работу")
end


if (a < 0) | (a > n)
    println("Введите другое a")
else
    println("Всё отлично продолжаем работу")
end

# Символ Якоби

g = 1
k = 0
s = 0.0
a1 = 0
while a1 != 1
    if a == 0.0 
        println("Результат для 0: 0")
        break
    elseif a == 1.0
        println("Результат итог для а: $g")
        break
    else
        if a % 2 == 0
            global a1 = a
            while a1 % 2 == 0
                global k += 1
                global a1 = a / 2
                println("A1: $a1")
            end
        end
    end

    if (k % 2 == 0) | (mod(n-1, 8) == 0) & (mod(n+1, 8) == 0)
        global s = 1
        println("S1 $s")
    elseif (mod(n-3, 8) == 0) | (mod(n+3, 8) == 0)
        global s = -1
        println("S2 $s")
    end

    if a1 == 1.0
        global result = g*s
        println("Результат итог для а1: $result")
        break
    end

    if (mod(n-3, 4) == 0) | (mod(a1-3, 4) == 0)
        global s -= s
        println("S3 $s")
    end

    global a = mod(n, a1)
    global n = a1
    global g = g*s
    println("a: $a")
    println("n: $n")
    println("g: $g")
end

