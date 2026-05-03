EXIT_COMMAND = 'exit'

def fizz_buzz
  input = ''
  until input == EXIT_COMMAND
    puts "数字を入力してください。(#{EXIT_COMMAND}で終了)"
    line = gets
    break if line.nil?
    input = line.chomp
    next unless input.match?(/\A\d+\z/)
    number = input.to_i

    if number % 15 == 0
      puts 'fizz_buzz'
    elsif number % 3 == 0
      puts 'fizz'
    elsif number % 5 == 0
      puts 'buzz'
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  fizz_buzz
end
