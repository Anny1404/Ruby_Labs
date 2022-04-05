puts "Hello, World!"

STUDENTS = "students.txt"
BUFFER = "buffer.txt"

def index(fileName)
  file_data = File.read(fileName).split("\n")
  return file_data
end

def find (id)
  File.foreach(STUDENTS).with_index do |student, index|
    return student if id == index
  end
end

def where(pattern)
  File.foreach(STUDENTS).with_index do |student, index|
  return student if student.include?(pattern)
  end
end

def update(id, text)
  buffer_file = File.open(BUFFER, 'w')
  File.foreach(STUDENTS).with_index do |student, index|
  buffer_file.puts(id == index ? text : student)
  end
  buffer_file.close
  File.write(STUDENTS, File.read(BUFFER))
  File.delete(BUFFER) if File.exist?(BUFFER)
  return
end

def delete(id)
  buffer_file = File.open(BUFFER, 'w')
  # students_file = File.open(STUDENTS)
  File.foreach(STUDENTS).with_index do |student, index|
    buffer_file.puts student if id != index
  end 
  buffer_file.close
  File.write(STUDENTS, File.read(BUFFER))
  File.delete(BUFFER) if File.exist?(BUFFER)
  return
end

# index
# find
# where
# update(7,"testing")
# delete(2)


def second_task
  inputFile = File.open(STUDENTS)
  results = File.open("results.txt", "a")

  buffer = inputFile.readlines.map(&:chomp)

  loop do
    print "Введите возраст. Для выхода из цикла введите -1: "
    input_age = gets.to_i
    break if input_age == -1
    
    matchedStudents = []

    # Поиск совпадающих по условию строк
    buffer.each do |student|
      puts "Проверяем студента #{student}... "
      if student.include?(input_age.to_s) then matchedStudents.push(student) end
    end

    # Запись найденных строк в результирующий файл и удаление из буффера
    matchedStudents.each do |student|
        puts "Перенос студента #{student}."
        results.puts(student)
        buffer.delete(student)
    end

    puts "== Осталось студентов: #{buffer.count}"

    break if allStudentsHasBeenCopied(buffer)
  end
 
  inputFile.close
  results.close

  puts "Работа программы завершена"
end

def allStudentsHasBeenCopied(buffer)
    return buffer.count == 0
end





DEFAULT_BALANCE = 100.0
BALANCE_FILE = "balance.txt"



def third_task
  read_balance

  loop do
    puts "\nВведите одну из команд: \nD - Депозит \nW - Вывод \nB - Баланс \nQ - Выход"
    inputCommand = gets.chomp.to_s
    case inputCommand
      when "D", "d"
        deposit
      when "W", "w"
        withdraw
      when "B", "b"
        balance
      when "Q", "q"
        break
      else
        puts "Команды #{inputCommand} не существует, введите одну из представленнных."
    end
  end

  write_balance
end

def read_balance
 if File.exists?(BALANCE_FILE) & File.read(BALANCE_FILE) != nil
    @balance = File.read(BALANCE_FILE).to_f
  else
    @balance = File.write(BALANCE_FILE, DEFAULT_BALANCE, mode: "w").to_f
  end
end

def write_balance
  File.write(BALANCE_FILE, @balance)
end

def deposit
  print "Какую сумму вы хотели бы внести на счет ? "
  depositSum = gets.to_f
  if depositSum > 0
    @balance += depositSum
    balance
    return @balance
  else 
    puts "Введенная сумма некорректна"
  end
end

def withdraw
  print "Какую сумму вы хотели бы снять? "
  withdrawSum = gets.to_f
  
  if withdrawSum <= 0
    puts "Введенная сумма некорректна."
    return
  end

  if withdrawSum > @balance
    puts "Введенная сумма больше остатка на балансе." 
    return
  end

  @balance -= withdrawSum
  balance
  return @balance
end

def balance
  puts "Ваш баланс: #{@balance}"
  return @balance
end






### Main

# File.delete("results.txt") if File.exists?("results.txt")
# index(STUDENTS)
# second_task
# index("test.txt")
# third_task
