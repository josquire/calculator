@op_array = ['+', '-', '/', '*']

def main
  puts "Welcome to the Ruby Calculator"
  puts 'What is the first number'
  @first_number = gets.to_f
  operators
end

def new_menu
  puts "1. Start with last answer?"
  puts "2. Clear calculator"
  puts "3. Exit"
  start_again = gets.to_i
    if start_again == 1
      puts "#{@answer} is your first number"
      @answer = @first_number
      operators
    elsif start_again == 2
      main
    else
      exit 0
    end
end

def operators
  puts 'What is the operator?'
  @operator = gets.strip

  if @op_array.include? @operator
  else
    puts "operator #{@operator} is not supported.  I only support: + - / *, Please try again."
    operators
  end
  second
end

def second
  puts 'What is the second number'
  @second_number = gets.to_f

  if @op_array.include? @operator
    case @operator
    when '+'
      @answer = @first_number + @second_number
    when '-'
      @answer = @first_number - @second_number
    when '/'
      if @second_number == 0
        puts "Invalid number must be greater than zero. Try again."
        second
      else
        @answer = @first_number / @second_number
      end

    when '*'
      @answer = @first_number * @second_number
    end
  end
  calculate
end

def calculate
  puts "Calculating..."
  puts "The Result of #{@first_number} #{@operator} #{@second_number} is #{@answer}"
  new_menu
end


main
