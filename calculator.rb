@op_array = ['+', '-', '/', '*']
@history = []

def main
  puts "Welcome to the Ruby Calculator"
  puts 'What is the first number'
  @first_number = gets.to_f
  operators
end

def new_menu
  puts "\n1. Start with last answer?"
  puts "2. Clear calculator"
  puts "3. Calculator History"
  puts "4. Enter your equation"
  puts "5. Exit"

  start_again = gets.to_i
    if start_again == 1
      puts "#{@answer} is your first number"
      @answer = @first_number
      operators
    elsif start_again == 2
      main
    elsif start_again == 3
      calc_history
    elsif start_again == 4
      string_input
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
  @history << "#{@first_number} #{@operator} #{@second_number} = #{@answer}"
  calculate
end

def calculate
  puts "Calculating..."
  puts "\nThe Result of #{@first_number} #{@operator} #{@second_number} is #{@answer}"
  new_menu
end

def calc_history
  @history.each do |formulas|
    puts formulas
  end
  new_menu
end

def string_input
  puts "What is your equation?"
  equation = gets.strip.split(' ')
  array_calculate(equation)
end

def array_calculate(array)
  num1 = array[0]
  opand = array[1]
  num2 = array[2]
# I don't know what to do with this now
end

main
