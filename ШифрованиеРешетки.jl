function vigenere(text, key)
    text = replace(text, " "=>"")
    text = lowercase(text)
    text = replace(text, "ё"=>"е")  
    key = lowercase(key)
    key = replace(key, "ё"=>"е")
    text = replace(text, "[^а-я]" => "")
    key = replace(key, "[^а-я]" => "")   
    alphabet = ['а','б','в','г','д','е','ж','з','и','й','к','л','м','н','о',
                'п','р','с','т','у','ф','х','ц','ч','ш','щ','ъ','ы','ь','э','ю','я']
    N = length(alphabet)
    
    letter_to_index = Dict{Char, Int}()
    index_to_letter = Dict{Int, Char}()
    for (i, c) in enumerate(alphabet)
        letter_to_index[c] = i
        index_to_letter[i] = c
    end
     
    text_chars = collect(text)
    key_chars = collect(key)
    
    key_repeated = Char[]
    while length(key_repeated) < length(text_chars) 
        append!(key_repeated, key_chars) 
    end
    key_repeated = key_repeated[1:length(text_chars)]
    
    ciphertext = Char[]
    for i in 1:length(text_chars)
        p_char = text_chars[i]
        k_char = key_repeated[i]
        p_index = letter_to_index[p_char] 
        k_index = letter_to_index[k_char] 
        cipher_index = (p_index + k_index - 2) % N + 1 
        c_char = index_to_letter[cipher_index]         
        push!(ciphertext, c_char)
    end
    return join(ciphertext)
end

text = "сложно держать информацию в секрете"
key = "правила"
ciphertext = vigenere(text, keyword)
println(ciphertext)
