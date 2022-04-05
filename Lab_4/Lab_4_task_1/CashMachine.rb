class CashMachine
  DEFAULT_BALANCE = 100.0
  BALANCE_FILE = "balance.txt"

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

  def init
    
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
end