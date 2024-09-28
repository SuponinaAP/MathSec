function cipher(text, m, n, keyword)
    text = replace(text, " "=>"")
    text = lowercase(text)
    
    letters = collect(text)
    
    len = m * n 
    
    blocks = [letters[i:min(i+len-1, end)] for i in 1:len:length(letters)]
    
    if length(blocks[end]) < len
        end_len = len - length(blocks[end])
        blocks[end] = vcat(blocks[end], ['я' for _ in 1:end_len])
    end
    
    function alphabet(letter)
        code = Int(letter)
        pos = code - 1071 
        return pos
    end
    
    key = collect(keyword)
    key_pos = [alphabet(c) for c in key]
    sort_pos = sortperm(key_pos)
    column_order = sort_pos
    cipher_text = ""
    
    for block in blocks

        mat = Array{Char}(undef, m, n)
        index = 1
        for i in 1:m
            for j in 1:n
                mat[i, j] = block[index] 
                index += 1               
            end
        end
    
        
        for col in column_order
            for row in 1:m
                cipher_text *= mat[row, col]
            end
        end
    end
    
    return cipher_text
end

text = "попробуй разгадать этот шифр"
m = 5 
n = 5 
keyword = "давай" 
cipher_text = cipher(text, m, n, keyword)
println(cipher_text)