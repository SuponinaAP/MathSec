n = 19
a = 7

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

# Тест Ферма

r = mod(a^(n-1), n) 

if r == 1
    println("Число n, вероятно, простое")
else
    println("Число n составное")
end
