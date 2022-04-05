def end_with_cs
  puts "Введите слово:"
  input_word = gets.to_s.chomp
  if input_word.reverse[0,2] == "sc"
    return 2**input_word.length
  else return input_word.reverse
  end
end

def pokemons
  pokemons_array = []
  puts "Сколько покемонов вы хотели бы ввести ?"
  pokemons_count = gets.to_i

  pokemons_count.times do 
    puts "Введите имя покемона"
    pokemons_name = gets.to_s.chomp
    puts "Введите цвет покемона"
    pokemons_colors = gets.to_s.chomp
    pokemons_array << { pokemons_name => pokemons_colors}
  end
  
  return(pokemons_array)
end

# end_with_cs
# pokemons