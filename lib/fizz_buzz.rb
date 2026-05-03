# frozen_string_literal: true

EXIT_COMMAND = 'exit'

def fizz_buzz # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
  input = ''
  until input == EXIT_COMMAND
    puts "数字を入力してください。(#{EXIT_COMMAND}で終了)"
    line = gets
    break if line.nil?

    input = line.chomp
    next unless input.match?(/\A\d+\z/)

    number = input.to_i

    if (number % 15).zero?
      puts 'fizz_buzz'
    elsif (number % 3).zero?
      puts 'fizz'
    elsif (number % 5).zero?
      puts 'buzz'
    end
  end
end

fizz_buzz if __FILE__ == $PROGRAM_NAME
