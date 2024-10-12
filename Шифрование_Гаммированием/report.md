---
## Front matter
title: "Отчёт по лабораторной работе 3"
author: "Супонина Анастасия Павловна"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
  - spelling=modern
  - babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: IBM Plex Serif
romanfont: IBM Plex Serif
sansfont: IBM Plex Sans
monofont: IBM Plex Mono
mathfont: STIX Two Math
mainfontoptions: Ligatures=Common,Ligatures=TeX,Scale=0.94
romanfontoptions: Ligatures=Common,Ligatures=TeX,Scale=0.94
sansfontoptions: Ligatures=Common,Ligatures=TeX,Scale=MatchLowercase,Scale=0.94
monofontoptions: Scale=MatchLowercase,Scale=0.94,FakeStretch=0.9
mathfontoptions:
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Изучить шифрование гаммированием и реализовать программу шифрования используя язык программирования Julia.

# Задание

***Программно реализовать на языке Julia шифрование гаммированием***

# Теоретическое введение

Шифрование гаммированием — это симметричный метод шифрования, при котором на открытый текст накладывается последовательность, сформированная из случайных чисел. 

Важным в шифровании гаммированием является то, что сгенерированный случайно ключ должен быть той же длины, что и сообщение, которое необходимо зашифровать.

В данном виде шифрования используется *побитовое сложение*, а данная операция является обратной, поэтому для того, чтобы расшифровать результат нужно просто прогнать его через шифр с тем же самым ключом.

Пример:
a = 01000011,  b = 01110010
тогда c = a xor b: 
$$
\begin{matrix}
01000011 \\
01110010 \\
------\\
00110001
\end{matrix}
$$
c = 00110001, а чтобы получить обратно a, меняем их местами в в формуле
$$
\begin{matrix}
00110001 \\
01110010 \\
------\\
01000011
\end{matrix}
$$

## Используемые функции
randstring - создает рандомную строку из заданных данных, заданной длины
xor - производит побитовое сложение
codepoint - возвращает кодовую точку Unicode соответствующую символу

# Выполнение лабораторной работы

Создаю переменные *k - для записи ключа к шифру* и *text - для записи сообщения которое нужно зашифровать*.
Также для создания рандомного ключа ввожу функцию **Random** и использую randstring(['ввожу переменные из которых делается выбор'], 'задаю длину ключа').

!['Введение функции и запись переменных'](Photo\code1.JPG)

Для шифрования нам нужно побитовое сложение произвожу его поэлементно при помощи цикла for.
Само побитовое сложение выполняю при помощи функции xor.
Также не забываем вернуть элементы в формат строки, использую для этого Char.

!['Создание цикла for с побитовым сложением'](Photo\code3.JPG)

Не смотря на то, что создавая ключ через randstring, я задавала длину такую же как у введенного сообщения, для страховки создаю if, который проверяет условие равенста длин сообщения и ключа.
Далее вписываю подготовленный цикл for, и добавляю return, чтобы функция возвращала зашифрованный текст.

!['Функция шифровки и дешифровки'](Photo\code2.JPG)

Для вывода переменных я использовала несколько разных способов:
printstyled - позволяет меня цвет выводимой записи
println - отвечает за перенос следующей записи на новую строку

В выводе дешифрованного текста я отправляю полученный зашифрованный текст обратно в созданную функцию с тем же ключом шифрования.

!['Вывод переменных'](Photo\code4.JPG)

Здесь представлен итоговый вид кода.

!['Итоговый код'](Photo\code.JPG)

После запуска наблюдаю, что программа работает верно, цвета вводного текста и дешифрованного одинаковые и текст тоже одинаковый.
Также выполняю несколько раз, чтобы убедиться, что рандомная генерация ключа работает и программа также работаем с любым из сгенерированных ключей.

!['Результат выполнения программы'](Photo\code5.JPG)


# Выводы

В процессе выполнения работы, я разобралась с принципом работы шифрования гаммированием. Изучила новые функции Julia, такие как randstring, xor и codepoint. Реализовала шифрование гаммированием на языке программирования Julia.

# Список литературы{.unnumbered}

::: Пособие по лабораторной работе 3 {file:///C:/Users/bermu/Downloads/lab03.pdf}

