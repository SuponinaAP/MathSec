function fleissner_cipher(text, pass)
    
    text = replace(text, " "=>"")
    text = lowercase(text)
    
    text = replace(text, "[^а-яё]" => "")
    pass= lowercase(pass)
    pass = replace(pass, "[^а-яё]" => "")

    N = 4  
    if length(pass) < N
        error("Password length must be at least N (which is 4).") 
    elseif length(pass) > N
        pass = pass[1:N]  
    end

    if length(unique(collect(pass))) != N
        error("The password must contain unique letters of length N.")
    end
    
    text_chars = collect(text)   
    total_cells = N^2  
    if length(text_chars) < total_cells
        padding_length = total_cells - length(text_chars)
        text_chars = vcat(text_chars, ['я' for _ in 1:padding_length])
    elseif length(text_chars) > total_cells
        text_chars = text_chars[1:total_cells]
    end

    
    big_grid_letters = Array{Char}(undef, N, N)    
    hole_positions = [(1,1), (2,4), (3,3), (4,2)]  
                                                    

    function rotate_positions(positions, N)
        rotated_positions = []
        for (i, j) in positions
            i_new = j 
            j_new = N - i + 1 
            push!(rotated_positions, (i_new, j_new)) 
        end
        return rotated_positions
    end

    index = 1  
    current_positions = hole_positions
    for rotation in 0:3
        for (i, j) in current_positions
            big_grid_letters[i, j] = text_chars[index] 
            index += 1
        end 
        current_positions = rotate_positions(current_positions, N)
    end

    pass_chars = collect(pass)
    pass_mapping = Dict{Char, Int}()
    for i in 1:N
        pass_mapping[pass_chars[i]] = i
    end

    sorted_pass_chars = sort(pass_chars) 
    column_order = [pass_mapping[c] for c in sorted_pass_chars]

    ciphertext = ""
    for col in column_order
        for row in 1:N
            ciphertext *= big_grid_letters[row, col]
        end
    end

    return ciphertext
end

text = "сообщение передано"
pass = "шифр"
ciphertext = fleissner_cipher(text, pass)
println(ciphertext)