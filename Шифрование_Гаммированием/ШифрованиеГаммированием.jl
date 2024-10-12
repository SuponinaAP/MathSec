using Random

k = ""
text = "Have a nice day"
k *= randstring(['A':'Z'; 'a':'z'; '0':'9'], length(text)) #создание рандомного ключа длины текста

function cipher(text, k) #функция шифрования и дешифровки
    if length(text) == length(k)
        cipher_text = ""
        for i in 1:length(text)
            cipher_text_bit = xor(codepoint(text[i]), codepoint(k[i]))
            cipher_text *= Char(cipher_text_bit)
        end  
    end
    return cipher_text   
end

cipher_text = cipher(text, k)

printstyled("Текст:", text; color = :green)
println(" Ключ шифра:", k)
printstyled("Зашифрованный текст:", cipher_text; color = :blue)
printstyled(" Дешифрованный текст:", cipher(cipher_text, k); color = :green)