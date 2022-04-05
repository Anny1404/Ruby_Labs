
def greeting
  puts 'Введите свое имя, фамилию и возраст'
  first_name = gets.to_s
  second_name = gets.to_s
  age = gets.to_i

 if age < 18
  return "Привет, #{first_name} #{second_name}, тебе меньше 18 лет, но начать учиться программировать никогда не рано!"
 else return "Hi, #{first_name} #{second_name}, самое время заняться делом!" 
    end
end

def foobar (a,b)
 if a == 20 or b == 20
  return b
 else return a+b
 end
end