p = 107
a = 10
r = 53
b = 64

# Функция, определяющая преобразование
function otobr(t, z, w)
    if t < r
        z += 1
        return mod(a * t, p), z, w
    else
        w += 1
        return mod(b * t, p), z, w
    end
end

# Инициализация значений для c и d
u, v = 2, 2  # Для c
U, V = 2, 2  # Для d

c = a^u * b^v % p  # Начальное значение c
d = c  # Начальное значение d

println("Начальное значение c: ", c)
println("Начальное значение d: ", d)

# Применяем преобразование для c и d
c, u, v = otobr(c, u, v)
d, U, V = otobr(d, U, V)
d, U, V = otobr(d, U, V)

println("Обновленное значение c: ", c)
println("Обновленное значение d: ", d)

# Функция для обнаружения коллизий
function second(c, d, u, v, U, V)
    while c != d
        c, u, v = otobr(c, u, v)  # Обновление для медленного указателя
        d, U, V = otobr(d, U, V)  # Первое обновление для быстрого указателя
        d, U, V = otobr(d, U, V)  # Второе обновление для быстрого указателя
        println("Текущее значение c: $c, d: $d")
    end
    return c, d, u, v, U, V
end

# Находим коллизию
c, d, u, v, U, V = second(c, d, u, v, U, V)

println("Итоговое значение c: ", c)
println("Итоговое значение d: ", d)
println("Итоговое значение u: ", u)
println("Итоговое значение v: ", v)
println("Итоговое значение U: ", U)
println("Итоговое значение V: ", V)


# Функция для вычисления x из логарифмов
function compute_x(u, v, U, V, r)
    # Вычисляем разницу логарифмов
    delta_v = mod(v - V, r)  # Теперь ∆v используется с x
    delta_u = mod(U - u, r)

    if delta_v == 0
        return "Решений нет"  # Если delta_v = 0, решения не существует
    end

    delta_v_inv = invmod(delta_v, r)

    # Вычисляем x
    x = mod(delta_u * delta_v_inv, r)  # Здесь x = ∆u * (∆v)^-1 mod r
    return x
end

# Функция для вычисления обратного элемента по модулю
function invmod(a, m)
    g, x, _ = gcdx(a, m)
    if g != 1
        throw(ArgumentError("Обратного элемента не существует"))
    else
        return mod(x, m)
    end
end

# Вычисляем x
x = compute_x(u, v, U, V, r)

println("Логарифм x: ", x)



