r_array = [64, 32]
i = 1
while i <= 1000 
  push!(r_array, r_array[i]%r_array[i+1])
  if r_array[i+2] == 0
      println("НОД:", r_array[i+1])
      break
  else
    global i += 1
  end

end

r_array = [81, 23]
k = 1
i = 1
if r_array[1] == r_array[2]
  println("НОД:", r_array[1])
else
  if (r_array[2]%2 == 0)
    r_array[2] = r_array[2]/2
    if (r_array[1]%2 == 0)
      r_array[1] = r_array[1]/2
      k = 2
    end
  elseif (r_array[1]%2 != 0)
    r_array[1] = r_array[1]-r_array[2]
  end
  while i <= 1000 
    if r_array[i]%r_array[i+1] == 0
        println("НОД:", k*r_array[i+1])
        break
    else
      push!(r_array, r_array[i]%r_array[i+1])
      global i += 1
    end
  end

end

